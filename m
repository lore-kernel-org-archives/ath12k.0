Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939C0C41535
	for <ath12k@archiver.kernel.org>; Sat, 16 Dec 2023 19:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+9sShBDsTdVnKb9n4ZvnLfHm0Z+0s6aw5qPF3Itqsg=; b=KKAoY20TOzpzNRZ6VrH9fpaghZ
	mJhv7XSErV+i1kHTS7ZyCeeiwoDHd2PvE/6WUsN4y0nwnXm0qgr8VzgT7WK/mumLhfP8G81TJZm3H
	1Xpu/WQ+/Mq9tFCezO4JdYwH8gWK60eylRDtj5lFZro/Kb0dsw7Lh49Vagl8LkLRpp3EeQrTjLN4b
	ByJiuT0EgF5w/rSfO+5E3rsdKQIBmO7ww/tN9NK4GU+M9Ty59bLO25Xqc9S0LvfHkpy3mv/d632Ma
	seSQprMQP6CSd+WsKDY9V0EKPzg2wu1ztE/w0QG97pLmZgCR5SeemEt/3cq1GGd/Dcx6vgQVWpD3s
	bbpkmSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaCW-006bmm-0x
	for ath12k@archiver.kernel.org;
	Sat, 16 Dec 2023 19:19:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaCT-006bmO-1C
	for ath12k@lists.infradead.org;
	Sat, 16 Dec 2023 19:19:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BGJIQ0Y009774;
	Sat, 16 Dec 2023 19:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7+9sShBDsTdVnKb9n4ZvnLfHm0Z+0s6aw5qPF3Itqsg=; b=Tu
	9GHv7nnqK5F71xzeWoq8X1XMOlWcwg2U7f4xFZPeJJpKrN5RccEkyShXc2U0edYe
	SXnnaNE6tfwZ7ENsukjt0AVFVD/smBRclP/xt4A2OJdmz54sJzOF9BSaiplVPerC
	NMdtLKSBr7A0uQ/CCJ9JhM5zfI1VeT/jyuxl2jmPYyY6QCN1XJxUrtOH1fa227t7
	DJHx5eVw9oYk1F2tEOg/NQk4Ljh9ZVN+BY7PZH9qKM1QTohzoF1lnEew6OwGbK3w
	xyd7Hj55Z3tIBiCD6IeZ5X7Yno5AxGrvhxP1uQovxyCzuHoz3oBOhfCGAum7i0Ol
	UOj6GhKF6aE0PXwzgU7g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v151jh1bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 19:19:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BGJJm8F020907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 19:19:48 GMT
Received: from [10.110.36.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 16 Dec
 2023 11:19:47 -0800
Message-ID: <1927e33a-694c-4262-8da3-74e09c0d2b28@quicinc.com>
Date: Sat, 16 Dec 2023 11:19:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] wifi: ath12k: add fallback board name without variant
 while searching board-2.bin
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231216060140.30611-1-quic_bqiang@quicinc.com>
 <20231216060140.30611-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231216060140.30611-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nMWgqvNokEar-swjh1qEbrj3ZwxEN-jh
X-Proofpoint-GUID: nMWgqvNokEar-swjh1qEbrj3ZwxEN-jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=464 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312160148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_111949_413943_A961C9A8 
X-CRM114-Status: UNSURE (   6.58  )
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

On 12/15/2023 10:01 PM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently a variant value read from DT or SMBIOS is considered while
> searching board-2.bin, this may fail because not all board-2.bin files
> contains that symbol.
> 
> Add fallback board name which removes variant value and searches again
> in board-2.bin when fails to increase boot up success rate.
> 
> dmesg log after this patch:
<snipped>
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


