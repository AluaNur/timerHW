//
//  TableViewController.swift
//  timerHW
//
//  Created by Alua Nurakhanova on 29.08.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayNews = [NewsInfo(headline: "France to ban full-length Muslim dresses in schools, renewing fierce debate", newsDescr: """
France’s government has announced that it will ban abayas — the long, flowing dresses worn by some Muslim women — in public schools, kicking off a fierce national debate about secularism, individual freedoms and what counts as a religious symbol.

                              France has long been preoccupied with the proper place of religion in public life. Secularism is a key concept in its constitution, and religious markers considered conspicuous or “ostentatious,” including Islamic headscarves, large Christian crosses and Jewish yarmulkes, have been banned from public schools since 2004 under French law.

                              Education Minister Gabriel Attal announced the ban this week, just days before the start of the new academic year, saying public schools have a duty to uphold “the most elementary principles of our Republic.” He likened abayas, as well as khamis, robes worn by some Muslim men, to other banned markers of an individual’s religion.
""", magazine: "Washington Post", date: ""),
                     NewsInfo(headline: "20 Years Ago, Madonna’s Three-Way Kiss Caused a Stir. Would It Today?", newsDescr: """
Twenty years ago today, one of the most iconic performances in MTV Video Music Awards history graced our television screens—and went on to cause a worldwide stir. Three of pop music’s top acts, Madonna, Britney Spears, and Christina Aguilera, hit the main stage together to perform a rendition of Madonna’s songs “Like a Virgin” and “Hollywood.”
 Madonna was dressed in black, as the “groom,” while Britney and Christina were her bridal babes, with white veils and all. The campy show came to a dramatic finish when the trio shared a steamy three-way kiss, prompting international headlines, a bit of hysteria, and a whole lot of controversy.
""", magazine: "Vogue", date: ""),
                     NewsInfo(headline: "US Open 2023: Novak Djokovic to replace Carlos Alcaraz as world number one after win", newsDescr: """
Novak Djokovic will replace young rival Carlos Alcaraz as the men's world number one after a routine win on his US Open return.

Serbia's Djokovic, who lost the Wimbledon final to Alcaraz, won 6-0 6-2 6-3 against France's Alexandre Muller in Monday's night session in New York.

Djokovic, 36, was not allowed to play in the United States last year because he was not vaccinated against Covid-19.

He has returned knowing another title will be a record-equalling 24th major.

Matching Australian Margaret Court's all-time tally is Djokovic's target and he made a statement start by breezing past 84th-ranked Muller.

""", magazine: "BBC Sport", date: ""),
    NewsInfo(headline: "Peaceful Atom' Sparks Fierce Debate In Kazakh Village Slated To Host Nuclear Power Plant", newsDescr: """
ULKEN, Kazakhstan -- Plans are under way to build a nuclear power plant (NPP) scheduled to be online by 2035, to supply Kazakhstan's soaring energy needs.

In Ulken, where the plant is likely to be built, opinions among the village's 1,500 residents on what a nuclear future for their impoverished lakeside village would look like are split.

Ulken is located 330 kilometers northwest of Almaty on the shores of Lake Balkhash. The village was created in the 1980s to house workers for a planned hydroelectric power plant. That project was unfinished when the Soviet Union collapsed and high-rise apartments are the only completed constructions from the period.

Officially, Ulken is a village, but it feels like an urban settlement. There are no houses here, only apartments. There is no livestock, and no gardens grow in the rocky soil.
""", magazine: "Radio Free Europe", date: "")]
    
   @objc func addNews() {
        arrayNews.insert(arrayNews[3], at: 0)
        tableView.reloadData()
    }
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(addNews), userInfo: nil, repeats: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let labelNewsHeadline = cell.viewWithTag(1001) as! UILabel
        labelNewsHeadline.text = arrayNews[indexPath.row].headline
        let labelNewsDescr = cell.viewWithTag(1004) as! UILabel
        labelNewsDescr.text = arrayNews[indexPath.row].newsDescr
        let labelMagazine = cell.viewWithTag(1002) as! UILabel
        labelMagazine.text = arrayNews[indexPath.row].magazine
        
        let labelDate = cell.viewWithTag(1003) as! UILabel
        labelDate.text = arrayNews[indexPath.row].date
        
        let dateFormatter = DateFormatter()
        let todayDate = Date()
        dateFormatter.dateFormat = "dd.MM.y HH:mm:ss"
        let formattedDate = dateFormatter.string(from: todayDate)
        labelDate.text = String(formattedDate)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 208
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
