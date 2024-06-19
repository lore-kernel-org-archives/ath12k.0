Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B09CC27C79
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 03:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PS6pgSqowtmSYVpHBn5Y+bGvvwHWd3ec5wuM8HblyY=; b=o0/bsEE8DA3SS4bbbRzdhfSBJ8
	5R6XYAT5CbkY+SdVbp3b7NyQcOm4Kri47ZbLO6VV0EsvdCZiXezGRxzOXN7OM5a8Dwn8sVdxl6DQm
	uvvw5MNq80Om0134MyhEJSOhrNfCEtNR8w/FvPkA1S2ToRi7Y5X1oMvAL6GJoeZZB3dbBuR4icFYw
	xkBO06+ocLUUJw3nyO3CdGwt0faqHoAMhWZG2TRqtW9jZYjk3htm2CwNfu4WI+sGI2knsyyjQ6Fmb
	0mRZKCCdTUhJA8JobQrcjF+Umkj51NliKKIUxYJjgJi0HJFRCmzHubiLXiZSbmfx42OEQsJPiaiXh
	n5iEE2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJmBt-0000000HJ2g-00G7
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 03:40:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJmBp-0000000HJ1a-2JIi
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 03:40:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILaNaH001119;
	Wed, 19 Jun 2024 03:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PS6pgSqowtmSYVpHBn5Y+bGvvwHWd3ec5wuM8HblyY=; b=LoyPKZKNIArL160V
	BF5Xmslb9Ta6/FTNOhTVfyA0SMtl/Tn901bbMWLiUP+hVn7kS3jIATB9Z8DaOCfB
	3QLUvqq2nqlee/UNW0qYox+elcTsGa4hDpikTE/N9malVp55ZVIQvA50RTDww8Qj
	Kq0+1cmWLWRsurEGPsba0u2qNT1KJQnJqz7S1oyqvYn49taJKp0BoWicd2sC1Ebm
	My/2WsMnbcFRjsrd7CUygF82W5WnqLeTfAGYDSgAZ+mRuFx42x3GgMM4Q4NdKrKJ
	7RGJo3X74c4fw1O7ecUEi7tK42NShRkyNWcL5LTVjcmyoagOpOo5QyV2aZ1x9tnw
	/58WVw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja28hym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 03:40:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J3eoDg015429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 03:40:50 GMT
Received: from [10.152.193.243] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 20:40:49 -0700
Message-ID: <5277edb6-cbb5-4b7f-8e2f-df702483021f@quicinc.com>
Date: Wed, 19 Jun 2024 09:10:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] wifi: ath12k: add factory test mode support
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240617052903.2720292-1-quic_aarasahu@quicinc.com>
 <20240617052903.2720292-4-quic_aarasahu@quicinc.com>
 <1f760727-6395-40a9-b817-3c05a5760a10@quicinc.com>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <1f760727-6395-40a9-b817-3c05a5760a10@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _fSQT5PjqzAssZ5y_BuH6cNECBrO6-6n
X-Proofpoint-ORIG-GUID: _fSQT5PjqzAssZ5y_BuH6cNECBrO6-6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_08,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_204053_928396_B69327B4 
X-CRM114-Status: GOOD (  16.85  )
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



On 6/18/2024 2:43 AM, Jeff Johnson wrote:
> On 6/16/2024 10:29 PM, Aaradhana Sahu wrote:
>> Add support to process factory test mode commands(FTM) for calibration.
>> By default firmware start with MISSION mode and to process the FTM commands
>> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
>> The pre-request is all the radios should be down before starting the test.
>>
>> All ath12k test mode interface related commands specified in enum
>> ath_tm_cmd.
>>
>> When start command ATH_TM_CMD_TESTMODE_START is received, ar state
>> is set to test Mode and FTM daemon sends test mode command to wifi
>> driver via cfg80211. Wifi driver sends these command to firmware as
>> wmi events. If it is segmented commands it will be broken down into
>> multiple segments and encoded with TLV header else it is sent to
>> firmware as it is.
>>
>> Firmware response via UTF events, wifi driver creates skb and send
>> to cfg80211, cfg80211 sends firmware response to FTM daemon via
>> netlink message.
>>
>> Command to boot in ftm mode
>> insmod ath12k ftm_mode=1
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
>> ---
> ...
>>  11 files changed, 560 insertions(+), 8 deletions(-)
>>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
> ...
>> +		ftm_cmd->seg_hdr.segmentinfo = le32_encode_bits(num_segments,
>> +								ATH12K_FTM_SEGHDR_TOTAL_SEGMENTS) |
>> +					       le32_encode_bits(segnumber,
>> +								ATH12K_FTM_SEGHDR_CURRENT_SEQ);
> 
> ath12k-check warns:
> drivers/net/wireless/ath/ath12k/testmode.c:265: line length of 99 exceeds 90 columns
> drivers/net/wireless/ath/ath12k/testmode.c:267: line length of 95 exceeds 90 columns
> 
> suggest splitting the first line at the =
> 		ftm_cmd->seg_hdr.segmentinfo =
> 			le32_encode_bits(num_segments,
> 					 ATH12K_FTM_SEGHDR_TOTAL_SEGMENTS) |
> 			le32_encode_bits(segnumber,
> 					 ATH12K_FTM_SEGHDR_CURRENT_SEQ);
> 

Sure, will update in the next version.

