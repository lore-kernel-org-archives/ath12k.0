Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF2AC531DF
	for <ath12k@archiver.kernel.org>; Mon, 19 Aug 2024 02:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAhow+M5rroZ9Dmv5yVK6CLl5R1vsjevSo+o109dEbY=; b=HFnPpjyBskcBlld63sbK56FQla
	zociKgwticYtQYXc/rjfVTSkQR5wDD8Jnt4m2pezk/0Hh+yWr4y1OhMZC1wrXe4oKBs104HksFled
	j5kA66bBdCMBNhBdzBV7Y2wkojfmtxOWl1CKJIPWjb5HzFIj4ERvz6KD0exNQbRMlNx2qmrVQB9lm
	Bdq7awDCH4+37aDhP7h+i0OCCP9cnnylnwQwbABsTAA9ngjrce3/PfmXp54916g2VIQRvCwJmZNV6
	m5vhD2PzYnZoEKu7c9O1XtFCmfKnP7/2fEJ2czDGghxQXKBWB/4f+LbLeuc5xZ2XLFuUheM/1dhMW
	7+qVm9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfsDK-000000008UM-3WZL
	for ath12k@archiver.kernel.org;
	Mon, 19 Aug 2024 02:33:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfsDI-000000008Sc-27L3
	for ath12k@lists.infradead.org;
	Mon, 19 Aug 2024 02:33:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47INrpmS025662;
	Mon, 19 Aug 2024 02:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAhow+M5rroZ9Dmv5yVK6CLl5R1vsjevSo+o109dEbY=; b=VigZhKc4D+7Goviv
	jjIXtDwXpBLKUCEtcYLFs4bwi5K6ez+N7F9PDjokR1ML9oQjASPCgwG5chLSV+D3
	5jVvEe30llprBMdUuBr8h2Ceu69H71eRYTyY1SfU8AoZsBMwHyJLfzKCBM8nxDk5
	b2lL+7y5lY9GSDai8HiPjJWJzs6tV7HmGNu1JLyd/Y5uVZ+oWSfDan+JhJPbPGsg
	8LD5THFyvc2S6GImNE3Lxr4nU1yMcDY6DWQHuvCevNKeG4C6CZv8ABPkCepf6qYd
	0/xzvhwXsJPQSn4HgNajcIShlUlefiJnsUqfb16dhEo+LVtDWX3sTPXS8cAqXpV/
	44utGA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412n582p1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 02:33:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J2XcNI025094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 02:33:38 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 18 Aug
 2024 19:33:37 -0700
Message-ID: <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com>
Date: Mon, 19 Aug 2024 10:33:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn7850 issues
To: david Atkins <david@3adesign.co.uk>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
 <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com>
 <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UKlRJeLtBP2JhZVZJ3m50wO9LvsBlaSG
X-Proofpoint-ORIG-GUID: UKlRJeLtBP2JhZVZJ3m50wO9LvsBlaSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-18_24,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_193344_574991_C7A55821 
X-CRM114-Status: GOOD (  12.97  )
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



On 8/16/2024 8:23 PM, david Atkins wrote:
>> On 8/15/2024 4:38 AM, david Atkins wrote:
>>>>
>>>> On 8/6/2024 4:06 PM, david Atkins wrote:
>>>>> No support for EHT and therefore no MSC 12 or 13 which fits with the
>>>>> dmesg warning about it not being supported,
>>>> did not noted this ... So if AP does not support EHT, above warnings
>>>> makes sense, like you said.
>>>>
>>>
>>> Anseres inline, AP supports EHT
>>>
>>>> is this a card firmware
>>>>> issue rather than the driver?
>>>> did not follow you here, why is it an issue?
>>>>
>>>
>>> Is the firmware that’s uploaded to the card not supporting EHT?
>>>
>> FW does support EHT.
>>
>> You are checking scan results, so it is AP not advertising EHT support (actually
>> AP supports EHT, it is missing in scan results because IW does not print it. I
>> don't know your IW, but at least upstream IW does not print it currently), not
>> WCN7850.
> 
> 
> I have captured beacon packets from the AP, they show the presence of EHT, this is a snip from the packet decoded, is there something here that would prevent the Hamilton card seeing eht?
> 
>         Ext Tag: EHT Capabilities (802.11be D3.0)
>             Ext Tag length: 14 (Tag len: 15)
>             Ext Tag Number: EHT Capabilities (802.11be D3.0) (108)
>             EHT MAC Capabilities Information: 0x0017, EPCS Priority Access Support, EHT OM Control Support, Triggered TXOP Sharing Mode 1 Support, Restricted TWT Support, Maximum MPDU Length: 3 895, EHT Link Adaptation Support: No feedback
>                 .... .... .... ...1 = EPCS Priority Access Support: Supported
>                 .... .... .... ..1. = EHT OM Control Support: Supported
>                 .... .... .... .1.. = Triggered TXOP Sharing Mode 1 Support: Supported
>                 .... .... .... 0... = Triggered TXOP Sharing Mode 2 Support: Not supported
>                 .... .... ...1 .... = Restricted TWT Support: Supported
>                 .... .... ..0. .... = SCS Traffic Description Support: Not supported
>                 .... .... 00.. .... = Maximum MPDU Length: 3 895 (0x0)
>                 .... ...0 .... .... = Maximum A-MPDU Length Exponent Extension: 0
>                 .... ..0. .... .... = EHT TRS Support: Not supported
>                 .... .0.. .... .... = TXOP Return Support In TXOP Sharing Mode 2: Not supported
>                 .... 0... .... .... = Two BQRs Support: Not supported
>                 ..00 .... .... .... = EHT Link Adaptation Support: No feedback (0)
>                 00.. .... .... .... = Reserved: 0x0
>             EHT PHY Capabilities Information
>                 EHT PHY Bits 0-15: 0xffe0
>                     .... .... .... ...0 = Reserved: 0x0
>                     .... .... .... ..0. = Support For 320 MHz in 6 GHz: Not supported
>                     .... .... .... .0.. = Support for 242-tone RU in BW Wider than 20 MHz: Not supported
>                     .... .... .... 0... = NDP With 4x EHT-LTF And 3.2 us GI: Not supported
>                     .... .... ...0 .... = Partial Bandwidth UL MU-MIMO: Not supported
>                     .... .... ..1. .... = SU Beamformer: Supported
>                     .... .... .1.. .... = SU Beamformee: Supported
>                     .... ..11 1... .... = Beamformee SS (<= 80 MHz): 0x7
>                     ...1 11.. .... .... = Beamformee SS (= 160 MHz): 0x7
>                     111. .... .... .... = Beamformee SS (= 320 MHz): 0x7
>                 EHT PHY Bits 16-31: 0x00db
>                     .... .... .... .011 = Number Of Sounding Dimensions (<= 80 MHz): 0x3
>                     .... .... ..01 1... = Number Of Sounding Dimensions (= 160 MHz): 0x3
>                     .... ...0 11.. .... = Number Of Sounding Dimensions (= 320 MHz): 0x3
>                     .... ..0. .... .... = Ng = 16 SU Feedback: Not supported
>                     .... .0.. .... .... = Ng = 16 MU Feedback: Not supported
>                     .... 0... .... .... = Codebook Size = (4,2) SU Feedback: Not supported
>                     ...0 .... .... .... = Codebook Size = (7,5) MU Feedback: Not supported
>                     ..0. .... .... .... = Triggered SU Beamforming Feedback: Not supported
>                     .0.. .... .... .... = Triggered MU Beamforming Partial BW Feedback: Not supported
>                     0... .... .... .... = Triggered CQI Feedback: Not supported
>                 EHT PHY Bits 32-39: 0x18
>                     .... ...0 = Partial Bandwidth DL MU-MIMO: Not supported
>                     .... ..0. = EHT PSR-Based SR support: Not supported
>                     .... .0.. = Power Boost Factor Support: Not supported
>                     .... 1... = EHT MU PPDU With 4x EHT-LTF and 0.8 us GI: Supported
>                     0001 .... = Max Nc: 1
>                 EHT PHY Bits 40-63: 0x3ed876
>                     .... .... .... .... .... ...0 = Non-Triggered CQI Feedback: Not supported
>                     .... .... .... .... .... ..1. = Tx 1024-QAM & 4096-QAM < 242-tone RU Support: Supported
>                     .... .... .... .... .... .1.. = Rx 1024-QAM & 4096-QAM < 242-tone-RU Support: Supported
>                     .... .... .... .... .... 0... = PPE Thresholds Present: Not Present
>                     .... .... .... .... ..11 .... = Common Nominal Packet Padding: 3
>                     .... .... .... .000 01.. .... = Maximum Number Of Supported EHT-LTFs: 1
>                     .... .... .101 1... .... .... = Support Of MCS 15: 11
>                     .... .... 1... .... .... .... = Support Of EHT DUP (MCS 14) in 6 GHz: Supported
>                     .... ...0 .... .... .... .... = Support For 20 MHz Operating STA Receiving NDP With Wider BW: Not supported
>                     .... ..1. .... .... .... .... = Non-OFDMA UL MU-MIMO (BW <= 80 MHz): Supported
>                     .... .1.. .... .... .... .... = Non-OFDMA UL MU-MIMO (BW = 160 MHz): Supported
>                     .... 1... .... .... .... .... = Non-OFDMA UL MU-MIMO (BW = 320 MHz): Supported
>                     ...1 .... .... .... .... .... = MU Beamformer (BW <= 80 MHz): Supported
>                     ..1. .... .... .... .... .... = MU Beamformer (BW = 160 MHz): Supported
>                     .0.. .... .... .... .... .... = MU Beamformer (BW = 320 MHz): Not supported
>                     0... .... .... .... .... .... = TB Sounding Feedback Rate Limit: Not supported
>                 EHT PHY Bits 64-71: 0x444400
>                     .... ...0 = Rx 1024-QAM In Wider Bandwidth DL OFDMA Support: Not supported
>                     .... ..0. = Rx 4096-QAM In Wider Bandwidth DL OFDMA SUpport: Not supported
>                     0000 00.. = Reserved: 0x00
>             Supported EHT-MCS and NSS Set
>                 EHT-MCS Map (BW <= 80MHz): 0x444444
>                     .... .... .... .... .... 0100 = Rx Max Nss That Supports EHT-MCS 0-9: 4
>                     .... .... .... .... 0100 .... = Tx Max Nss That Supports EHT-MCS 0-9: 4
>                     .... .... .... 0100 .... .... = Rx Max Nss That Supports EHT-MCS 10-11: 4
>                     .... .... 0100 .... .... .... = Tx Max Nss That Supports EHT-MCS 10-11: 4
>                     .... 0100 .... .... .... .... = Rx Max Nss That Supports EHT-MCS 12-13: 4
>                     0100 .... .... .... .... .... = Tx Max Nss That Supports EHT-MCS 12-13: 4
>         Ext Tag: EHT Operation (802.11be D3.0)
>             Ext Tag length: 8 (Tag len: 9)
>             Ext Tag Number: EHT Operation (802.11be D3.0) (106)
>             EHT Operation Parameters: 0x01, EHT Operation Information Present
>                 .... ...1 = EHT Operation Information Present: True
>                 .... ..0. = Disabled Subchannel Bitmap Present: False
>                 .... .0.. = EHT Default PE Duration: False
>                 .... 0... = Group Addressed BU Indication Limit: False
>                 ..00 .... = Group Addressed BU Indication Exponent: 0
>                 00.. .... = Reserved: 0x0
>             Basic EHT-MCS And Nss Set: 0x44444444
this means AP requires STA NSS to be equal or larger than 4, however WCN7850 only support 2, so connection in EHT is rejected.

>             Control: 0x02, Channel Width: 80 MHz EHT BSS bandwidth
>                 .... .010 = Channel Width: 80 MHz EHT BSS bandwidth (2)
>                 0000 0... = Reserved: 0x00
>             CCFS0: 0x0000006a
>             CCFS1: 0x00000000
> 
> 

