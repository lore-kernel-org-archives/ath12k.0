Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D251BC52D7D
	for <ath12k@archiver.kernel.org>; Mon, 12 Aug 2024 22:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tIQ0JAED2gtRsBzo8WoYCk+yYNckei+8xlTHO9Pxcs=; b=VcqJFwQt4D/NY2/c9Seprl8bQP
	x9KsDqYbeU3QNmpsM34kWa775wLAp5jVxST0LLphxnU4+YgWrYdeU68NycociXj4SMn58GJMjATWg
	85UzG1gUuNy2L55c1No1coqoWaI41EuY+u7o/wKVbMGXsQvRCJl8cvm5TqFRCClRqV5X8ppuI5gps
	o6Aq0UTUjSOB8RRIv3NCXlji1+Uch6dqPVcPl+5/wZlMfszy6ZxRiYv8Dyxlyig8XSqN6geQms7r5
	eTT63KbZdD1V2iACiE/V3fkVIod2VVugN9KVK6Au1Eptn0e0h9TN++T/61syvHcdob4UNhR4WMsSM
	9hyRGQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sddM9-00000001h2g-1oqp
	for ath12k@archiver.kernel.org;
	Mon, 12 Aug 2024 22:17:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sddM6-00000001h1k-0gs3
	for ath12k@lists.infradead.org;
	Mon, 12 Aug 2024 22:17:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSWHl015866;
	Mon, 12 Aug 2024 22:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tIQ0JAED2gtRsBzo8WoYCk+yYNckei+8xlTHO9Pxcs=; b=K+8cdcE+91CXFkbR
	DYdWxal7EmA1//77MUQ2jDgyLZqEgThI2TIMWEeZRkcS4Yj4fKiph9kZ4YZ+JMBw
	6AJgJz7yqDzfaZEqHd7X2psoFXEdUY149/NklanRzObUpQoSuoh33VwZ/Q3bdzfX
	PYSqyJU5uv0Jhew4XDus0JhR/RROF7RUPBUbCPyUw3Ro1CjkYsGuiuVbxag47khv
	z7rUpgULN0jNu8PMYmIgu5ctZgsjZZkW7A9Wg3A5jyq7/fCSc/y8Hae6iD3PKGpN
	i4H8f8Fv56PIBkNcK9nWCd9q8vWNiet4W8y7SGHdz51aQNAYY5zQCVl14SZXhMwI
	+pbzpA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1chnfx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 22:17:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CMHU6k030478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 22:17:30 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 Aug
 2024 15:17:30 -0700
Message-ID: <a8b3e9ed-20ef-4536-b56d-f8ae89dd53d0@quicinc.com>
Date: Mon, 12 Aug 2024 15:17:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix the stack frame size warning in
 ath12k_mac_op_hw_scan
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240809015841.2671448-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240809015841.2671448-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5sNwWYuWvzQCy_jH0_mf33T8VKzeqFmp
X-Proofpoint-ORIG-GUID: 5sNwWYuWvzQCy_jH0_mf33T8VKzeqFmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=654 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_151734_226807_7D5417A3 
X-CRM114-Status: UNSURE (   6.55  )
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

On 8/8/2024 6:58 PM, Miaoqing Pan wrote:
> Fix the following W=1 kernel build warning:
> 
> drivers/net/wireless/ath/ath12k/mac.c: In function ‘ath12k_mac_op_hw_scan’:
> drivers/net/wireless/ath/ath12k/mac.c:3806:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



