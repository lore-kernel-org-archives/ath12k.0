Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A3C47077
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUDCpT90dG8/HzGH6UiXotTVBpfgMjkPr9rKU+bxjKE=; b=h8ChQ/bEr3GSeVWaCSnsW3z4Vl
	QvA0jgalPKAsR0f8wg0h621uxj0kqVU9ffs60lk0MKRR1RrN+kqu7iRkWIcUYkoukMqhIfzlyEhvH
	LwKl2TAHHorRaWLcIGPri/i76EEa98jXj1Zji95oL9aTYvUy2+KsBy3bVadt3keunbz6x43WP/HIy
	IqZiXLY0iIS/iD/OGM9JfMZHNa3x3HOGWeNeEV9UM1QKNSwkbUiZP+n3dHUQ5XOPbSg7i2PkphvY/
	FUqZpABh8fxJiUo9L/M/iYK7QqEp47B6DGxqMyfuudntXeZ5+dacZIafKpDWo2i/A8w//xwn1hKQK
	hRhwgpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPoTA-00D2h6-00
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 18:47:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPoT6-00D2eM-1F
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 18:47:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GHeIhf027111;
	Tue, 16 Jan 2024 18:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vUDCpT90dG8/HzGH6UiXotTVBpfgMjkPr9rKU+bxjKE=; b=HR
	6/bxy5UbAr9DiRdS5vJWM5K/oeywOirJZ5i4CAcZO6SBYlQP6OtPACh4Pu/a141+
	z4gQ47w9vBJIm2y28M8dC9HHc2sA9N/1ubATys9C306fkqceMBkWhPMT573oQFHU
	7YTo1Lj4A52i7Fz9C8L0o4biPBAVHJ9ceCmllPcU4Zq2WryGsLR4jbjSA1oNeZKq
	9H6sHmJq8KWIWtiw3af8KSAetIKZZ3kuV7bfnn4hOW+DSrcdY9Ts9N8rwgjzE8mC
	chtgQzv/1rGS3sxCSo59+PJOR4OoPoOTRb1TkWWuPYMk26T1f6gE4+0L85ljUWGf
	LKx6qdWZLgsDlNEBsUWA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnnvbhhtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 18:47:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40GIkxHt020105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 18:46:59 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 16 Jan
 2024 10:46:59 -0800
Message-ID: <b5f39cb3-ec5e-40f0-bf29-96175435c0b2@quicinc.com>
Date: Tue, 16 Jan 2024 10:46:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add support for collecting firmware log
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240115023726.2866-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240115023726.2866-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m_mSQ0W_973iJiR2VWZfRagbIeeFleRy
X-Proofpoint-ORIG-GUID: m_mSQ0W_973iJiR2VWZfRagbIeeFleRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=747 lowpriorityscore=0 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401160149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_104724_442210_D715B55D 
X-CRM114-Status: GOOD (  10.25  )
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

On 1/14/2024 6:37 PM, Baochen Qiang wrote:
> Currently there is no way to collect firmware log because firmware
> does not send it to host. Also host does not handle WMI_DIAG_EVENTID
> which is used by firmware to upload firmware log.
> 
> So add support for it by firstly enabling firmware log upload via a
> QMI message, and secondly processing WMI DIAG event to expose it to
> userspace via trace event.
> 
> This change applies to both WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



