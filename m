Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79916D149E8
	for <ath12k@archiver.kernel.org>; Fri, 25 Oct 2024 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8x3WVkVoyIe5L83o8I4+/CGXpddJbCkokvyFk5WPck=; b=JivkIV3fbYOBPBbfIfLh/sIOfo
	y89scgildAMZc3lJAKVUpZLiBftCnunbVlq6SqnZFr7A3h7yPVqNEpnvD+AwfE0wtqSWwhSpM3q+E
	RuoS3bq0JqWx+IRFWq0Y1cZIztRgeA3RdUCcl3c05DjBNDD9Fh83a/hnTp7f6F0J2yJnA+tBjxMeE
	283o4ewVp7vOc+e66JMtwf3Z04w/wPwDHp1Sv4r+SNSA7kQF1vfl0L7TmvRzhQQ8bjTT4jm6Tgaaw
	nLlAw0mhOSnMQzjklVH6yvbkwIkUR5FlbENP4/hmmNegmVrFGZPPLY3qHc/pCvedjxhnza0ymbKCX
	p8mQVzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QP8-0000000535D-0mUI
	for ath12k@archiver.kernel.org;
	Fri, 25 Oct 2024 19:55:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PwG-00000004yWQ-19QU
	for ath12k@lists.infradead.org;
	Fri, 25 Oct 2024 19:25:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB2H54001156;
	Fri, 25 Oct 2024 19:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8x3WVkVoyIe5L83o8I4+/CGXpddJbCkokvyFk5WPck=; b=EgbbVWLUkIDjOyPA
	+8vTJRYSMNd1thxy66cj9XgQHt/0q6jIkbCPJEwAP3M1tYoE0CJ/z5ypJfuF2/c3
	X97HNHZF7iv2VeWjNkkqE1Dj1CK8Fz8CRYU0DqWNbzRZb13q5ki2jJt6leyMtoPm
	VoKiic6aNi9nDyLWZY+ZaRumM1cc8HohJMxujJO7ewBfROtQmpEWJ1DCXp6x1rLu
	DAhYKiEuq7HL3Pr5nhj4CRLaLCzF+b3YcCcGuWXATSTmaN3uBC8dGvf/Q6tLasJD
	xouvnW/fhW88WjhQ5wHD85WXL9MU+09w5JO1JKm4K8kohxU8G5yZL/i/2AKtXdzg
	tmtndQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s1e8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 19:25:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PJPZYh010762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 19:25:35 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 12:25:34 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>, Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241022072406.3231450-1-quic_rajkbhag@quicinc.com>
References: <20241022072406.3231450-1-quic_rajkbhag@quicinc.com>
Subject: Re: [PATCH v3] wifi: ath12k: convert tasklet to BH workqueue for
 CE interrupts
Message-ID: <172988433462.1407878.10004847719683728035.b4-ty@quicinc.com>
Date: Fri, 25 Oct 2024 12:25:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GReO3n0zVMpT1VOt8qmknqIyHPZWSUQx
X-Proofpoint-GUID: GReO3n0zVMpT1VOt8qmknqIyHPZWSUQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=645 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_122536_365897_9B3A54F8 
X-CRM114-Status: UNSURE (   7.90  )
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


On Tue, 22 Oct 2024 12:54:06 +0530, Raj Kumar Bhagat wrote:
> Currently in Ath12k, tasklet is used to handle the BH context of CE
> interrupts. However the tasklet is marked deprecated and has some
> design flaws. To replace tasklets, BH workqueue support has been
> added. BH workqueue behaves similarly to regular workqueues except
> that the queued work items are executed in the BH context.
> 
> Hence, convert the tasklet to BH workqueue for handling CE interrupts
> in the BH context.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: convert tasklet to BH workqueue for CE interrupts
      commit: cdad737160571a98cc4933a62c9f2728e965ab27

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


