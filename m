Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9131FCFA45E
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 18:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9V9GMiOKYvOG8D9BTGYrGORbewbut1V45qDwNWe5lg=; b=ij1IrZ0N/IIhVoAsxnAokLDPR3
	R3IiTRruPA0FyevOaUslMMB4dFPR56trCsv2p8RgoG5+OSMd29TuBtt+25hlcY2V4uYleo/Hn28RA
	PsBD8i8Uw1C8IT2aVQOEZMbNbP9OEVHV+yKXLdUE7rGOFM4ZuvZF5l9REboxGc/tmoFK8PcAonFXB
	YehArKXmEAPG+/7DCyRnQx/oW/iGMYbLnHt8fTESrFRMLmvScbZnWkKS7GKonc8c2zVyCWlNNUU6M
	cG5wz3cvOZ8Lj47qszIvxTWXnCZ+XILejKKSUIchSgPmKNk3Ogzn0AU+1XTwlHx+kbZLExTzfBUvJ
	2d3OTOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g1V-0000000FVuG-0yCf
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 18:23:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3f1b-0000000FLkw-3MQd
	for ath12k@bombadil.infradead.org;
	Wed, 23 Oct 2024 17:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E9V9GMiOKYvOG8D9BTGYrGORbewbut1V45qDwNWe5lg=; b=HNKd9QIX0xGjb4F2wofw/kfxOQ
	2NuAk72+7nXrWOVUKBjy27P2SVlz9FnJBf8h71IbX6Bc4+O++iESlraLiVVbcVvnTwv01kcR7tx4Y
	EPilc3ZrhsH/PHMU/Tdx9d7BDmh0w7kC8E+U7AiY6wccE/wjVgbwl5ieYlSUTjix/WDaO7Ms/TISW
	eCz07v+nj63SbmbWbaU/6GTOxhQ3EsxacTGFgGNSAvuJbaJbEyPCpfLge75JBxdxfTozOxVohC7wo
	VCJdBQ9mwSF4e3Ta+dfi0Rojr+rt4bTYf78uj6kB6B0j0d9SHwCiV7+thG5krNDV5vP46/F6E0eL4
	N4J3FIsA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3f1Y-00000008URI-2tab
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 17:19:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9jcEB030928;
	Wed, 23 Oct 2024 17:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9V9GMiOKYvOG8D9BTGYrGORbewbut1V45qDwNWe5lg=; b=Agi5dss/Pg3HrQC8
	UvN3m1p7HefGvdroOBZgnpRTlnbZeaOeU3IqKJGzsyC9JlpYjyJqO4BlsZJRQJzn
	2IfKi4IXcI7/9QUPdC1NU7F3Ydfr3ZzD1QxMX5xPWR5GQDZFJEQlS2pOJlL2BYGe
	oWXZudQUh4VncAn7WVGkvfMSA0P2eNQXXOuyu17emVO0yVG3P3a4ddMcNUv7fhU1
	RV267JAllZQChs19pOO/e/b32ez/70cX+zn365JlvXWuvD4UCWQflQNnEojkdKcC
	NflkXQnGYAK5XWBY8aQTpx/exaf54d/1NSMo7qcB2WVSHPMJg+13gp2ENOc+Uq7n
	gz566w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w30vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 17:19:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NHJoCR018061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 17:19:50 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 10:19:50 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>, Kang Yang <quic_kangyang@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241022110831.974-1-quic_kangyang@quicinc.com>
References: <20241022110831.974-1-quic_kangyang@quicinc.com>
Subject: Re: [PATCH v6 0/8] wifi: ath12k: some fixes and clean up for
 monitor mode
Message-ID: <172970399023.4141877.14669488341667505907.b4-ty@quicinc.com>
Date: Wed, 23 Oct 2024 10:19:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GwxJqJ8X9OCkz9VfiyAXgpG1XzR_Y2xJ
X-Proofpoint-GUID: GwxJqJ8X9OCkz9VfiyAXgpG1XzR_Y2xJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=862
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_181957_121309_33AF2CC6 
X-CRM114-Status: UNSURE (   8.49  )
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


On Tue, 22 Oct 2024 19:08:23 +0800, Kang Yang wrote:
> This patch set does some fixes and clean up for monitor mode.
> 
> v6:
>     1. mention the change is also needed by QCN9274 in patch 2-5.
>     2. mention the change is cleanup for patch 6.
> v5:
>     1. rebase on tag: ath/ath12k-mlo.
>     2. remove patches which have conflicts with MLO branch.
> v4: rebase on tag: ath/main(ath-202410161539).
> v3: rebase on tag: ath/main(ath-202410111606).
> v2: rebase on tag: ath-202410072115.
> 
> [...]

Applied, thanks!

[1/8] wifi: ath12k: remove unused variable monitor_present
      commit: 4d05ee786e32179ea462d632f717aa89d3b06b41
[2/8] wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
      commit: 68e6a80b36197a2be22fdee9077509d37515f0df
[3/8] wifi: ath12k: fix struct hal_rx_ppdu_start
      commit: 2298e37ac0586fb53697e53719f86ab7c68d1f25
[4/8] wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
      commit: 04f33114af00317dc3c494e60a7c42292e0ffd7e
[5/8] wifi: ath12k: fix struct hal_rx_mpdu_start
      commit: f76bbedf5bda1e45339f44bbb9ed6d8f3262f4b0
[6/8] wifi: ath12k: delete NSS and TX power setting for monitor vdev
      commit: 78d2405fd51b6919a5f645db41f3bc8b2267d426
[7/8] wifi: ath12k: use tail MSDU to get MSDU information
      commit: bba112e6ed9b65e8abf0e3f9ac65ee851b14a8cf
[8/8] wifi: ath12k: fix A-MSDU indication in monitor mode
      commit: f7b982d13df72dbf8c1f3f98fadc9d9155608ecc

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


