Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22E8C021A0
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEDMpeBMSOQPuA5NUlj+OZr7o4+5HXVDCMV4Cy9c4Ig=; b=TRgp5f4Jkiltd+HQJGEuL0d8ND
	rYOHVZ8gdWCbZHT+5pF43noeFBiyezmAFBJdsYIweu+UM8kRhF7j9+nFF21BC8fxqhm60/BQUjv9U
	RZzKRBW5yPae/BmXfIoC/Zd/C7JRuzrPtRrM0uHCXNSA5rixpY2g2LXOJoLFOoTbkl1L3QF9XgoF3
	dTjYVyvLcAdDLs0JWfmQXS1CgTMq4a2i8rpWtqsW23nkHVOJef5leJ9f/y7UUO+12+GZxizo7Z7yP
	at4AD95Qi4QW3jLhD1GlaTWzfElrUdtQTB3KMcpNemqRTNlX/HiVhoSmtq1ezucDhu+i8a+XM3DlP
	jxZvG6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidOa-0000000C5Wn-2ZWj
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 17:53:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticY7-0000000Bv98-2Oh0
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 16:58:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DGaink008261;
	Thu, 13 Feb 2025 16:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TEDMpeBMSOQPuA5NUlj+OZr7o4+5HXVDCMV4Cy9c4Ig=; b=J6jN8exp9ztdPqkF
	TUfcMbSM5V0j5jpGgrSas8fBBqbiUMrGUmPzmaLjGmQk7eP6bzHliLYN/huGvb0Q
	+EXhLtTz7/1mxJoLSg5KylrxvKgdROWDvaKtAvCWlX0Zi8mjWvMBI8wy0ixMQnDy
	Schgxf2owY/Z8UOw/rf1xulO6j8g1Wy9+o3i6HqQx4fD9h9dM/BqVK7nGvJWI8O2
	J1nfRUnurKaiSVsOFvRQDi1oDUEHs00itOMiJwsAE2F1Kjmfs+r3qshbXaC2S6ny
	5gaQelXicnURUQnHHKRCasOwXs8Rs3HyD36LJNo7VEom2lYcDtdyVUUPQmEvcnFF
	KMDHLQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewhbjem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 16:58:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DGwos4010130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 16:58:50 GMT
Received: from [10.110.107.131] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 08:58:49 -0800
Message-ID: <5e83efc7-a3f9-4dbf-8b28-b097c3a203f1@quicinc.com>
Date: Thu, 13 Feb 2025 08:58:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20250213012439.278373-1-quic_pradeepc@quicinc.com>
 <20250213012439.278373-7-quic_pradeepc@quicinc.com>
 <78d9cf28-6fb0-44e7-8305-a2dc6b64a121@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <78d9cf28-6fb0-44e7-8305-a2dc6b64a121@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5sz4q54ShhIDp3OkbmwVMnbvOVDyG8Qv
X-Proofpoint-GUID: 5sz4q54ShhIDp3OkbmwVMnbvOVDyG8Qv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=915 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_085851_610445_E95A71F1 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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



On 2/12/2025 8:03 PM, Aditya Kumar Singh wrote:
> On 2/13/25 06:54, Pradeep Kumar Chitrapu wrote:
>> @@ -3690,6 +3859,7 @@ static void ath12k_mac_init_arvif(struct 
>> ath12k_vif *ahvif,
>>       for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
>>           arvif->bitrate_mask.control[i].legacy = 0xffffffff;
>> +        arvif->bitrate_mask.control[i].gi = NL80211_TXRATE_DEFAULT_GI;
>>           memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
>>                  sizeof(arvif->bitrate_mask.control[i].ht_mcs));
>>           memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
> 
> No need of setting arvif->bitrate_mask.control[i].he_mcs with 0xff ? It 
> was there in v9 and this change is not present in version change log 
> either.
> 
> 
Thanks for catching that..will fix this in next revision

