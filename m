Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA20CD1283
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 04:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UT59QlgKS3WS7yeK/Em14rK2iOM88E05ojXCflJgCQ=; b=hiw/DoIZNDXGi/CZ/0izo4smd4
	MhCRKok3Gx4naJZI4TJtMPxLgntAEcC67cEaGPUQRlkPY+tsuoeOXLkkAjG83rkEObOzOHgIJXWiT
	sz+ay29yh1z4ZktYicn8+xC5vNMoqky7/rCDjy3cBKU0Ya09wGQj8nyVVT8QKjWAxDGe/eB9GwQ8n
	d/YrNxTwozq8jOcbZQ1LJ12ImekwllTzIRaMb22Jlog7mUotgmU5+EcamEPHN3x9zIHg4edAPErfl
	mQf8DiVgdqpezOHTsmwhYiab1cyrmX5oVwF5v9OKurDn8x8yCKGpwOR7ZeEISPOy5kl35UH1a6dsl
	Qq+hSjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr98n-00000006sgq-0EyK
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 04:19:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr98j-00000006sfv-3cDj
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 04:19:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4313OXlF030720;
	Mon, 1 Apr 2024 04:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7UT59QlgKS3WS7yeK/Em14rK2iOM88E05ojXCflJgCQ=; b=TZ
	aRVF8/RSfiUI6y1SKoz/As6aK1Mmr19VaV+y83wxUNYxkrZfUCf0zJaP4UQj4jpS
	7DxFwoFMXplxmsSWbhMNSNDqxiPwFfQknua8h9TMeSXifzAOY7sWX2J9GfWzXA1I
	mvJruDod2QLOJYxGYZQjyTvrte5NHfGc+oIF6Qhb6pWJShh5ZVC6gPysoMe4iwkF
	xIzCApHE32a84SOk3gyLUW5taZjWT1aC42203FDiiWbEF02rYinXY1KQhYF3upP2
	zXYMurNbq0tRJUb7VLuWevav2YTvVwo46GN1jVDtqrZz5oS4WOnNLY1LbLiLHwpA
	5L5DpMjtKHkwRKs/3LBg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x6atwk3wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 04:19:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4314JFpm002001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 04:19:15 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 31 Mar
 2024 21:19:13 -0700
Message-ID: <304e71ec-4234-c07d-ab90-b2309325595c@quicinc.com>
Date: Mon, 1 Apr 2024 09:49:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise multiple
 radio in one wiphy
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kuTi8QQ9dfS_PL-RikdQnph40DLgmXfN
X-Proofpoint-ORIG-GUID: kuTi8QQ9dfS_PL-RikdQnph40DLgmXfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_01,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=765
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_211922_074294_B2421F2F 
X-CRM114-Status: GOOD (  10.40  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On 3/28/2024 1:16 PM, Johannes Berg wrote:
> That's a big set, not sure I can review it all at once :)
>
>
>> +struct ieee80211_chans_per_hw {
>> +	u32 n_chans;
>> +	struct ieee80211_channel chans[];
> That should probably use __counted_by() these days.

sure, will address this comment in the next version of the patch.


>> + * @num_hw: number of underlying hardware for which the channels list are
> "number of [...] hardware" sounds odd to me, perhaps 'devices'?

sure, will address this comment in the next version of the patch.


>> + *	advertised in @hw_chans, 0 if multi hardware is not support. Expect >2
>> + *	if multi hardware is support.
>> 1, I guess, not >2 - and ==1 makes no sense really, maybe it should say
> that?

sure, will address this comment in the next version of the patch.

-- 

Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


