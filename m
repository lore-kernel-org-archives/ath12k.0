Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD064C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4RgUdZEDJyofdEpQ0QmVWlr1oC0V22k8KmwizUyYRI=; b=SQRa1RxG9014RbCwkikjjLAG9p
	CiTLP60lPTywtb4YE3BIamZJwM/cZovYf3xodyobSBnmBQOPbrk2F0cMtOUqu6P/sjPF1YQUHB2VL
	3o1925/eDqy67Ii6xtYwdS9ai3/rpiQFJ8ddAX1WhsX20zvJ8zs276rwU6ttTRJFCkHBldxfC7WbU
	goNa6/iesoBR0I0ZiwDxK/V1Z6cl/gDJPERjFOVWq4bA4kjxnkD6PN9apfS+aRPup+VJJPYn144Ca
	vV1o+xkAjvA6ppeaWcyZITcJmIyYU9/XqDesFnQw9fLSm+FO83gFR2tyz1/1gu0qW4elU7GC6D5dF
	x9/UygKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpd-0000000EWKA-0W9D
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:51:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpZ-0000000EWIN-3Ba9
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:51:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MBjRhT009748;
	Mon, 22 Apr 2024 17:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=W4RgUdZEDJyofdEpQ0QmVWlr1oC0V22k8KmwizUyYRI=; b=eN
	YI+WYS/0+Xu+qE+8dPBksEnuPfZrcgbUuXTth8tAFwZ7l/vinZUOD/LXlB5oRtyu
	TQZysFoVlaMdW82Z1pZZxZZif5Et4FGXFbbZ9qD3Im/oGgQi34uhchf9N1I3plrC
	Va6kRn+ZrScKF1CA47mNPmV+zPyplgndczFRdjZrBdC7TN+mhX5I0x+lUocNUbQV
	KekTYycSo+cy4pVuV3BLtuQ+8XdcYpH/RFYqKZc976aoMoYMuPjLFgc5yo6Gdv0e
	FtSMrxEiR9WWHI5bA/h7pkj2t3f3gLsTuwiDJ7W8+XNyBRiDOf/wV+70EEFxyEc2
	600qnTwmn7xCf1/66tWQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnne298pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHppsT024330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:51 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:51:51 -0700
Message-ID: <cccbe3c3-6db3-43eb-9eca-fc16989a9c00@quicinc.com>
Date: Mon, 22 Apr 2024 10:51:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] wifi: ath12k: fix warning on DMA ring capabilities
 event
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-5-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-5-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z0Rto2CW--1e6GjoAJ8Q7GCu1eOjvHpS
X-Proofpoint-ORIG-GUID: z0Rto2CW--1e6GjoAJ8Q7GCu1eOjvHpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=444 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105153_974001_91CED75A 
X-CRM114-Status: UNSURE (   8.06  )
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
> We are seeing below warning in both reset and suspend/resume scenarios:
> 
> [ 4153.776040] ath12k_pci 0000:04:00.0: Already processed, so ignoring dma ring caps
> 
> This is because ab->num_db_cap is not cleared in
> ath12k_wmi_free_dbring_caps(), so clear it to avoid such
> warnings.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


