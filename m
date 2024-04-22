Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF312C07C79
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FvykEc6MT+7sm5CoYYCL+RYIKRYGnW3N/yymB/201c=; b=0ZT7S6eim43nFadHPO5J1rMrot
	7wZcejrQIREJn1DBi2g38/Gf7uZPm+2rSMLnCfwWTfSlicfw6EeYIybRTwFAlC3wNRhkQZ/9cIasy
	9Axzn3nU/HkEi4qYUNhihLZX872TgxepBpbdni7l36C683COTlRGBXank0RZphTN7EyLDLeFhP+yn
	CpFGzFBIBkDN4rqH0BYtQOmvdnV0uG/gq4lRRAl3kyyf1AiBDtbv22uYboM4rbpeuaj42NF6j+NKV
	ZfMwv5Vj0MXyrvdIm0FWa/u4Mq6UeqWiXWSzr+cPKdty2MqMIbawZtAb2dp6mIYT87PIZHz0zqA3B
	/7wPsBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpt-0000000EWQN-1MFD
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:52:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpq-0000000EWOX-0dtV
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:52:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M5cL75020716;
	Mon, 22 Apr 2024 17:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7FvykEc6MT+7sm5CoYYCL+RYIKRYGnW3N/yymB/201c=; b=AP
	Fs+JTs9TdfX5GPS+bUD6YcyWQg4wqMlWeF2MKY1PStv/7fBjFfRjrtkPh0xYn35m
	qePbK0DUfXLTs1eeB/VTmWjz9HyOT9xIJ0ivEW6uluZZA/tYba80/FDtagK/2QXV
	xYVNATYhIfsqZQnOcPcr/BfRCDaUzzoTHnW5z9Vkl1OHqzTnGvtl21MviuVs7qgP
	SClhO6DaeknABfmxQJ47UXShobz+NfBUjqSHshSgFLg5gasP11XI1cEc7xAaPSMH
	JfFV4vh0+W2IiQToiY2z48xuK2CZy+lbPaLppZ+5504jr4sgPgKvsuT96hLeuxYZ
	iLvZJGF/MTthdfedZklQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm4qddafu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:52:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHq8MA024820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:52:08 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:52:07 -0700
Message-ID: <5dd501d3-8668-4d31-8210-4f397b27b1cc@quicinc.com>
Date: Mon, 22 Apr 2024 10:52:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] wifi: ath12k: avoid stopping mac80211 queues in
 ath12k_core_restart()
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-9-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-9-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KkjSp_V3h9fptCYImF_r-7Ez_IexUvPf
X-Proofpoint-ORIG-GUID: KkjSp_V3h9fptCYImF_r-7Ez_IexUvPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 mlxlogscore=641 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105210_378774_2F560593 
X-CRM114-Status: GOOD (  13.27  )
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

On 4/11/2024 11:06 PM, Baochen Qiang wrote:
> Currently when resume ath12k_core_restart() calls
> ath12k_core_pre_reconfigure_recovery() where mac80211 queues are
> stopped by calling ieee80211_stop_queues(). Then in
> ath12k_mac_op_reconfig_complete() those queues are not started
> because ieee80211_wake_queues() is skipped due to the check on
> reconfig_type. The result is that mac80211
> could not deliver any frame to ath12k to send out, finally making
> connection fail.
> 
> [84473.104249] PM: suspend exit
> [84479.372397] wlan0: no VHT 160 MHz capability on 5 GHz, limiting to 80 MHz
> [84479.372401] wlan0: determined local STA to be EHT, BW limited to 80 MHz
> [84479.372416] wlan0: determined AP 00:03:7f:12:b7:b7 to be HE
> [84479.372420] wlan0: connecting with HE mode, max bandwidth 80 MHz
> [84479.580348] wlan0: authenticate with 00:03:7f:12:b7:b7 (local address=00:03:7f:37:11:53)
> [84479.580351] wlan0: send auth to 00:03:7f:12:b7:b7 (try 1/3)
> [84480.698993] wlan0: send auth to 00:03:7f:12:b7:b7 (try 2/3)
> [84481.816505] wlan0: send auth to 00:03:7f:12:b7:b7 (try 3/3)
> [84482.810966] wlan0: authentication with 00:03:7f:12:b7:b7 timed out
> 
> Actually we don't need to stop/start queues during suspend/resume,
> so remove ath12k_core_pre_reconfigure_recovery() from ath12k_core_restart().
> This won't cause any regression because currently the only chance
> ath12k_core_restart() gets called is in reset case, where ab->is_reset
> is set so that function will never be executed.
> 
> Also remove ath12k_core_post_reconfigure_recovery() because it is
> not needed in suspend/resume case. This is also valid due to above
> analysis.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


