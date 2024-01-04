Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52358C47074
	for <ath12k@archiver.kernel.org>; Thu,  4 Jan 2024 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUPJi/0x2AaQZGagvItl4HW1clHe+YXjkhaqYMNXDHA=; b=JIbORns+Hf5tj/a3hZmRoMfnvD
	8uzJR5V2/a9knr2g8z2Q2x6uKi6tLPlYNZRsG5bVvLekGABnulGBAQGzgP/DuhT1MQTJjLYk0szgE
	VILV4sEfyjAGEDHn7XUGBrcnBI6ugDAOU+IzRmzPn/nfNX5jyNCCgQ75RmxIwyl26KDnaMMBCpZUw
	KXmzJnceH3kwq/CEvJsuAjoVTOXfqSo8yayRtj1gLjWZ+7KdvvdwHzRRC8h6uGteCr9O/sFFhPhkv
	Efr2QvmLw8l6i+JSwZoxCxyCn3Ae4FpE6oe4GFFMPfQAumzp7I/aQoGWiXK89alw+NPJzxF2olgGr
	DQF3qZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQv1-00Ek31-0D
	for ath12k@archiver.kernel.org;
	Thu, 04 Jan 2024 16:50:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQux-00Ek2e-1i
	for ath12k@lists.infradead.org;
	Thu, 04 Jan 2024 16:50:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 404DLCZL025271;
	Thu, 4 Jan 2024 16:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SUPJi/0x2AaQZGagvItl4HW1clHe+YXjkhaqYMNXDHA=; b=Ez
	2k7xAqfC7mb9hwRdBmnOCnC6PXqQstTaBVXC2ywqMKZaZRFSnsT/j+HeSStlZqsw
	OFfwa0ayhGXOvnYkPzixVUXnHQmTexGEILyi6GnCpiIF7U5V16L6FJe8sBS2Dseh
	Ji6p0weuRHOzXa+/KmRZu+Yavatubn3gVpXlqZfSDOEE7kQl5VJPQGNIvnzsCBlI
	fvi5Rw168T0rnt+dPZPrc+qoQjXS9OwMREvo1bgIqdIWAK3GPsXpnFN3avMxH6Ab
	ZaqRZ0kskQJwq0OL7co0Jke3OZ3T7v1WEUnR+0gNjvQEKiLqwlKD1MFdA2j25Z4W
	1rL/Ct11JAQeLyyY7WFA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd3mb4d2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jan 2024 16:50:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 404Go1mb019417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jan 2024 16:50:01 GMT
Received: from [10.110.76.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 4 Jan
 2024 08:50:00 -0800
Message-ID: <efd81ac0-8b82-43e0-aef3-44313a5187ba@quicinc.com>
Date: Thu, 4 Jan 2024 08:50:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add display tx and rx bitrate for 11be
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240104032202.19472-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240104032202.19472-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V4BdT1PXxSS8T7ZnXI8Kts_r9DybPyeL
X-Proofpoint-ORIG-GUID: V4BdT1PXxSS8T7ZnXI8Kts_r9DybPyeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=577 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_085003_690119_4C04E15E 
X-CRM114-Status: UNSURE (   9.09  )
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

On 1/3/2024 7:22 PM, Lingbo Kong wrote:
> When AP is in 11be state, STA's tx/rx bitrate display error value using iw
> dev wlan command.
> 
> In ath12k_dp_tx_update_txcompl() function, not handle the case when
> pkt_type is equal to HAL_TX_RATE_STATS_PKT_TYPE_11BE, so add a else if
> statement to handle this situation.
> 
> In ath12k_dp_rx_h_rate function, not handle the case when pkt_type is equal
> to RX_MSDU_START_PKT_TYPE_11BE, so add a case statement to handle this
> situation.
> 
> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
> tx bitrate: 1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
> rx bitrate: 1441.1 MBit/s 80MHz EHT-MCS 9 EHT-NSS 3 EHT-GI 0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


