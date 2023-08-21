Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACDDEE4996
	for <ath12k@archiver.kernel.org>; Mon, 21 Aug 2023 07:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+YP4QYsYKGJcwGX4ouHtNk+bqC92znS8W2ktk+R0Cg=; b=Qfxc/3ikrsGLni
	Xw9zz3VsngaQzoc5XrLQ3UeykuJC7zj5KXfJM05tYij0l3WCLulhVydwxqpL/B8J3iHuq4Yafk6tK
	4FwnqG8ZyxSVoUxt/5L6jnXuTTMgNfM3GvIutpwrWhOGJdGUZGzgLRf1P3MBH2soLbC1xAuG5KB8o
	U/E90WETqSKoa9SOr53jU/m1074JOxWqfog0u9ZOFcEPLicF7nSFErnXc2EIknQh4iZModGfLDUeo
	wHj/EXpHRLez9IZJkzwYkxXNrBwp0AbVSJPkHw0dT9+LZIguiTSquM+YchlOPnUZ3r9Cqe7hHjPx3
	sJv/jFM74Y/GEyPwglCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzdz-00DOUD-1o
	for ath12k@archiver.kernel.org;
	Mon, 21 Aug 2023 07:48:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzdx-00DOTj-0s
	for ath12k@lists.infradead.org;
	Mon, 21 Aug 2023 07:48:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37L7RVNu022354;
	Mon, 21 Aug 2023 07:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NXI2/SUbqvE8w14U/0XCRbpJsK9Wr2dkwOZ72ISoBjM=;
 b=dJe3IXV4QtSXxRa4vYAivNVJ1Yvt/kbA2Ak3WXbNlOXDcnx4LsR/ujNmHp7jba9NMYKF
 NEJsnQWnlTFGqHMrpw2LDcbKZ2xRftx53tt+aF3uE6DUWb3x1Za7enkUsfm1KTnsB2xG
 P/u5VPM22oG2V0IHug4UjQLyacKPxgy7+PKCFXUUTUAjx6hPlbXeG7MPdCmeKyl+aaYR
 43yq0V2i1RtaZ8v0Jx/hsmwluDPQgUrfUozKtkNw/dc6+/XHj/ABZ7fyp1N9tKvPYfom
 TMyPervcY+Tvv5R2Pb9jTqVunbgF1BNuQNw7YuK/hcM4diR22wA2GDGc0AOR/K01tO6A 5Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sjny935xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 07:48:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37L7m77X024510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 07:48:07 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 21 Aug
 2023 00:48:06 -0700
Message-ID: <0a264e30-af70-a6ff-eb2b-c3862540ee1b@quicinc.com>
Date: Mon, 21 Aug 2023 15:48:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] wifi: mac80211: fix cfg80211_bss always hold when assoc
 response fail for MLO connection
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230821061355.18168-1-quic_wgong@quicinc.com>
 <5c072b0a45ad29dc03b989fbd9a9fd974ae0c23d.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <5c072b0a45ad29dc03b989fbd9a9fd974ae0c23d.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NtxixyU_oKjlGNGN1ANlOlxmSRsGvWlY
X-Proofpoint-GUID: NtxixyU_oKjlGNGN1ANlOlxmSRsGvWlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-20_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308210070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_004809_309580_F2641451 
X-CRM114-Status: GOOD (  17.72  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/21/2023 3:40 PM, Johannes Berg wrote:
> On Mon, 2023-08-21 at 02:13 -0400, Wen Gong wrote:
>> +++ b/net/mac80211/mlme.c
>> @@ -5429,17 +5429,22 @@ static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_sub_if_data *sdata,
>>   	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
>>   		struct ieee80211_link_data *link;
>>   
>> -		link = sdata_dereference(sdata->link[link_id], sdata);
>> -		if (!link)
>> -			continue;
>> -
>>   		if (!assoc_data->link[link_id].bss)
>>   			continue;
>>   
>>   		resp.links[link_id].bss = assoc_data->link[link_id].bss;
>> -		resp.links[link_id].addr = link->conf->addr;
>>   		resp.links[link_id].status = assoc_data->link[link_id].status;
>>   
>> +		link = sdata_dereference(sdata->link[link_id], sdata);
>> +
>> +		if (!link) {
>> +			/* use the addr of assoc_data link which is set in ieee80211_mgd_assoc() */
>> +			resp.links[link_id].addr = assoc_data->link[link_id].addr;
> As I mentioned before, this cannot be done - it introduces use-after-
> free since assoc_data is freed after the loop, and the
> cfg80211_rx_assoc_resp() is after that.

So I want to change the "const u8 *addr" to "u8 addr[ETH_ALEN] 
__aligned(2);" of struct

cfg80211_rx_assoc_resp and copy the value, then no use-after-free, is it OK?

>> +			continue;
>> +		}
>> +
>> +		resp.links[link_id].addr = link->conf->addr;
>>
> Also, I don't see that we need to use two different assignments for the
> two cases.
Then I will change to both use "assoc_data->link[link_id].addr", is it OK?
> johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
