Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA314D462CA
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmJoY+ntPjmWdc/w7kCIiXQsQT3cQCdetcJKvfEJzGE=; b=Sho+oWrphZE+ljtnEzB3vUOFAp
	upwOpDtzYbMSe4vyjD4aS5AxaD8WqUuPtqjvx7wtGKWY2dYFIm6nk+QPePJQRnxEuHQDiNWgRxIb8
	lL9lsV85vcuaxAKROFY/GiKzSQJVxUwtZd7bU11OkBqSr1EcvvMIiSclHsowO7uZEQoidVPNuWIlQ
	3xCX3V6Rp3bRDZXrdnvxI88MIDvobZPN9vDrvV7Ix4xNnnleOEmHb+HaBSS+sQDiLZYCQi8FFEPJ6
	rtfNvUDLh3lY+MG025sRElwWE97FSkyw074yckGHLH+0mXVXTAaEGAm0WsAFHH0TrC36ySnap/DDs
	RLN4SnOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFlW-00000007Nzx-2GID
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 15:58:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFlU-00000007Nya-0Wiq
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 15:58:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD7usAc030530;
	Wed, 13 Nov 2024 15:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HmJoY+ntPjmWdc/w7kCIiXQsQT3cQCdetcJKvfEJzGE=; b=jVvNg0OWOofayIfh
	SO0qa/Wi+J9GtYEA0+uzVsfbF47u3U5LBTm1zBJWK0zY6ufuJATgN4ZOPcHyq18b
	2hwn6Dgi3HVP0WFFodndAYal4JA5IAAAU4as0naGsb6fhzKQ18QQjEuKg9GzbteB
	dM/hj7VpbkRb0MVAIdW5EincfpiNZpUhSy1hcV3WZuAvAGf/B1DsXlhergOObtOt
	NtBJ8GbtHA7L7gL2tW5Fzt3qD4vt5F5VJFICly49eI9JepWyYUOQIzLj6JONyNPO
	6UklhqgZFm3wrs29aTSpkUyV9IKadGoP5pJgcxe7CG/K3k8sRGI1Rwpv60gLI8v0
	qj6yjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vr5y1757-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 15:58:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADFwdP8028237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 15:58:39 GMT
Received: from [10.48.243.207] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 07:58:38 -0800
Message-ID: <7f3454c0-9105-47ef-b450-5d1db3b84c82@quicinc.com>
Date: Wed, 13 Nov 2024 07:58:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] wifi: ath12k: Support Pager, Counter, SoC,
 Transmit Rate Stats
To: Kalle Valo <kvalo@kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241113072707.3377341-1-quic_rdevanat@quicinc.com>
 <87cyiz2y3z.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <87cyiz2y3z.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vIbXnIFtrXGz2amDidPBYz2wPD64fTZ8
X-Proofpoint-GUID: vIbXnIFtrXGz2amDidPBYz2wPD64fTZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=926 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_075844_202000_2A9FAA2F 
X-CRM114-Status: UNSURE (   5.38  )
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

On 11/13/2024 3:04 AM, Kalle Valo wrote:
> Jeff, does b4 pick up Acked-by from the cover letter or should I ack
> individual patches?

IDK. I know that patchwork doesn't pick it up unless you ack the individual
patches, so that is what I do.



