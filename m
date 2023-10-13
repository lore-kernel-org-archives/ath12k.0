Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B1BCDB483
	for <ath12k@archiver.kernel.org>; Fri, 13 Oct 2023 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgvNgwGm446obGDMkvGUjGJ87shmLL9dwz+RKvOpiDQ=; b=cx0GypiyZxsGPj
	uKG1PDBhmNj9NVsx5DkHduBMG7wXVD8tEWgsaQBx5zo6MLyMcD3VRDqKkLAVL0eY/EwssGkySrz3y
	XpB2sn6IGf1dIw/2IqhIrIKI6yNXgn8ymtmKWPr7Mxhia5XsfcDDs4RTLHzNmGqmhSFFtZ3tG1XYI
	Nrgwpba2sWGLUNpFsFmmcYaKkkkz/KAru2hRAsY5pUB/dcW37WiqMUQ3yjOCbc3d8uVWhssaGI7+u
	ZA9dc39JQegK6VEXi+9oUydR69IhmGz7kWiCfCPiyL9M4u4Qo/2uUH4Ogqnr/fPDYW8GOjJsp1AG+
	PXOrTmvgNiRF9YG3QiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJBs-003azc-1e
	for ath12k@archiver.kernel.org;
	Fri, 13 Oct 2023 14:31:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJBp-003ayq-0I
	for ath12k@lists.infradead.org;
	Fri, 13 Oct 2023 14:30:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DDojZj005405;
	Fri, 13 Oct 2023 14:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=byyPySpuEzs+k9GORQd9rQy1JwT/b/pZRBAjY44ovu8=;
 b=klI6eWPFPTZNlw0HbQvUWqLoUx8cPEi7yXoRrW2cF4o9ZT2+mA8YwhkR/STZvbL7QnkH
 rtCOgpzeQFQf8IdSWGaLlgvAxhfnQkjJPK2NOo8lUdG8XbNirEt1sXllZjqjMQ/YvFTC
 vSOkjjUfzfx3cIhyeM14pvxHP+OSf64VzOeBibpB4JEDpMPOVOgRZkXeySKEUuowGJG3
 Y+rfym6HdwHhtkOtJOXFiTHKFJ18AzfGe1Y6YWhgEasn8p0KukXZeApybjHyiyEmQOSD
 iR+9lw7NuJa6W6zO3gcWZpf7/BiE+oaxSBMsLeQwY7IqtRE6IQDUN4dRG4D0TE2tKlhp zw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpt1k1wab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 14:30:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39DEUs6O031999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 14:30:54 GMT
Received: from [10.111.181.241] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 13 Oct
 2023 07:30:54 -0700
Message-ID: <a661a608-e077-4b1c-ae9c-c0d1711bc1b0@quicinc.com>
Date: Fri, 13 Oct 2023 07:30:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Enable Mesh support for QCN9274
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231013070007.25597-1-quic_rgnanase@quicinc.com>
 <20231013070007.25597-2-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231013070007.25597-2-quic_rgnanase@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0CIFalHJkoriwyE-u3fptpIAbnY45BF8
X-Proofpoint-GUID: 0CIFalHJkoriwyE-u3fptpIAbnY45BF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_06,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=665 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_073057_243994_99C572DE 
X-CRM114-Status: UNSURE (   8.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/13/2023 12:00 AM, Ramya Gnanasekar wrote:
> Currently QCN9274 supports only AP and station interface modes.
> 
> Add interface type mesh to ath12k_hw_params for
> QCN9274 to provide support for mesh mode as well.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
