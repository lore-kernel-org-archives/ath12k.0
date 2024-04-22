Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABFCC07C79
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyOZPM8ijMcPgWvpArBTG9hntQw4SNsOW+E1Q5zmPfk=; b=v7OgckTtheLyrM8TgqrJ2D2Lon
	7auh8D/v/fHuq9VJlPz5oiwxlHbFUtUPkfPbUaPeS/N9TB+ScVbpurNV51c2udLW1af7sk0TLCu+3
	eeKfjAaKGGryMvioLdnW9l3HM5hCA6Ta4fzC8HaoYeGfqLqH7CH8rk1hCtrPBepz8UAf3+SD939R3
	+6voKTN8dKWjAhp7nXrDO4+Pjt47yae2IYzsswpslH4PDkAF5EYG1Ptpjet0N/eujHqzkEIfaMkNp
	CmZoNvG903Q9JlbgeCx3HL4UoRJCmetpVhRo7SJMj83Y98G0JDHsPvcvVv70h5PVdhoxqCdSfDiTs
	TVPUoOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpY-0000000EWI4-3NlW
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:51:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpV-0000000EWGV-0zZY
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:51:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MFNN2h020762;
	Mon, 22 Apr 2024 17:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=WyOZPM8ijMcPgWvpArBTG9hntQw4SNsOW+E1Q5zmPfk=; b=PJ
	5giiC6B4NJD/i14iXa9IS0OfUlUWi9FxGnGYkZypB6jMPR53x8XokyDXAC+zo686
	iZTEX6J2REuY4gCp08EOb9g55SLeyHCPoTkp3QeKQwJPWIgUXUkgytjrSrGxHa9u
	1nmNnZVIfq3n43HAIK1TnPmpm9X0ycbeLPT6dEmF+1C7dXTAI7X8r5ZG06lAOw3U
	BW5Gio6iHcloFbRdhfUTk4X457IndZXaKkiJf6kxa2BL8Oz4FKuy8XRTDZlqaA54
	3z+cy9w7QrU+eekuRPilFUCsrYUbESJxL4iry5X9NfogPkfgQr5AMmCtRuDNOrNP
	pjYGqFUdL6pJws0Zst/g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnm1bhhj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHpl5G011859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:47 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:51:46 -0700
Message-ID: <8982c4f6-d6e6-4cf0-a17b-082e8492225c@quicinc.com>
Date: Mon, 22 Apr 2024 10:51:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] wifi: ath12k: remove MHI LOOPBACK channels
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EvnAGChIwlRHnJcrr9jiDKbiMpLBwKbj
X-Proofpoint-ORIG-GUID: EvnAGChIwlRHnJcrr9jiDKbiMpLBwKbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=726 lowpriorityscore=0 impostorscore=0
 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105149_522717_6BFF9987 
X-CRM114-Status: UNSURE (   6.99  )
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

On 4/11/2024 11:06 PM, Baochen Qiang wrote:
> There is no driver to match these two channels, so
> remove them. This fixes warnings from MHI subsystem during suspend:
> 
> mhi mhi0_LOOPBACK: 1: Failed to reset channel, still resetting
> mhi mhi0_LOOPBACK: 0: Failed to reset channel, still resetting
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



