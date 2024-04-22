Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F886C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35z046m/ubf15VcFNvSX9mgVEoxSwqcsu9Rds7gmzHk=; b=K6IwGZdBhmTQ0tBBBtPfKLFqzV
	P4meeKZdmPpO8h7wT1j12NoyZS3F3LuNIUYqqBPlhnKfMKUdQ9DeqBNOQ7a9F7AZoPEMtO029J9mL
	1E4l7ebWjEek/mKtfiQ8F9qENVwzcZuIyYa/liiddZqXQpCowBxJAcuh+FwADLeW1kuHL6KpNyQOi
	0TWykI21mP0hEi9vPgu2LKWkUeMKWaBiW472H0PB0bvgWXtUQRmTleOkmYF9rFQr9RvWQcq+6c8fx
	msXD84b1Adn5NVOhmoSEeGkwul/QT2tkNzcy57m3D8sPvV02/6JCKhM3ClwlxPtFv2dur6cn+/F2s
	d+s9AFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpr-0000000EWPV-3paR
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:52:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpn-0000000EWNV-3kwo
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:52:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MFGcEh006832;
	Mon, 22 Apr 2024 17:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=35z046m/ubf15VcFNvSX9mgVEoxSwqcsu9Rds7gmzHk=; b=lQ
	sRyRlHKPjQEM/kcniLA6/OAzc2YINE9hMsQD8elUNnmuCHRFYCWCFMYRPeUU82Dg
	jfZMFMX39tsaXAtFdqKe5vF+pIyEebPWdoS4vU6jW1jGPLi0XllS9/59OgGfGIYQ
	N6KH9cSttzgDhYQUBf6oG2w61pwSbi8mHun36+yoUhikTzNjSPmX1SAOZR1VkoNn
	eYnv48yQzSu+use35v/Q5UUCYWGTDVUzOE37z15L3W9nLjGW275MMY8VNsYsR8jf
	YuyGuDWpZXbsHeIlnNmnWzyXhiOd5iXVqncQXxmV+Nc31E7OzyrJnMuD70qa9nik
	0EgaxWyc1UWGYaMtXP9g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnm1bhhkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:52:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHq6bh029330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:52:06 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:52:05 -0700
Message-ID: <09726b6f-fa0d-48fe-90f8-2e63ab6bf019@quicinc.com>
Date: Mon, 22 Apr 2024 10:52:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] wifi: ath12k: no need to handle pktlog during
 suspend/resume
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-8-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-8-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vMr5eV5dIj0rhVse2OD89Bep0zFbN4lm
X-Proofpoint-ORIG-GUID: vMr5eV5dIj0rhVse2OD89Bep0zFbN4lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=655 lowpriorityscore=0 impostorscore=0
 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105208_484877_365596DC 
X-CRM114-Status: UNSURE (   8.93  )
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
> Currently pktlog is stopped in suspend callback and started in
> resume callback, and in either scenarios it's basically to
> delete/modify ab->mon_reap_timer and to purge related rings.
> For WCN7850 it's pointless because pktlog is not enabled: both
> ab->mon_reap_timer and those rings are not initialized.
> 
> So remove pktlog handling in suspend/resume callbacks. And
> further, remove these two functions and related callee because
> no one is calling them.
> 
> Other chips are not affected because now only WCN7850 supports
> suspend/resume.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


