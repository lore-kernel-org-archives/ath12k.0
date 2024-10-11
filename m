Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E06D0D79C
	for <ath12k@archiver.kernel.org>; Fri, 11 Oct 2024 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERzIHVwlFdvmnBtVbHkaunW1nq8U/lMqB4r+fegQNMY=; b=yxYBNJMk6zDk2CiUziFKYxGmfy
	ZWsajSonaT0ZN9ZNxAjfFiAYQVqde2tGBjNGcDUacOjkcRRWVWk3ZFYOgAIrhHsY6qUt+uhU7YkEg
	Bgs4Bxh8UeiddWLTmh5YQqXG/afHK4BY//C8nEtRaHU187h0gceCBoa8DuOebsecY+v0stiJzwz0T
	5PWJbMhuFwm1ka6E5uS1+E08FsedjMibLl7jcEc6URupol4tRMB/rgWLHkJpEj8wOm1yunt/K4qXD
	tDEZY/gC9VWJapC4Qb4+h0U7PTVXvg6d88VvZres2kWZh+LGUEyAWuBgSO8eukYJaU6KjcgbVX7hw
	twJXVaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGsz-0000000GfRJ-1CLb
	for ath12k@archiver.kernel.org;
	Fri, 11 Oct 2024 14:44:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGno-0000000GdSY-1F0L
	for ath12k@lists.infradead.org;
	Fri, 11 Oct 2024 14:39:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BAAOPn021189;
	Fri, 11 Oct 2024 14:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERzIHVwlFdvmnBtVbHkaunW1nq8U/lMqB4r+fegQNMY=; b=Tc6N1DK/ErQSo0pa
	ldMWd1zT4R99wUAmlq0qb/d/KCUyTlMsXLuru947gg8PkB2+68vfJ9WBRhX8Ya3X
	N7x3jZi4QeBGQqi1KQUanp+4goXsT0LZxe9sQQmFKVv25D+GsxJm3RlDP6XAiQt7
	5PnpQQLW8tHEVOw2ITyFXli0KAaUTSrfqAvMjYyKo36sKHTzwVM9QGu4bzdT6khf
	SkcshTtdpoUjrawo5Kkam0rYzB9XNKbjNmbquaQMd3yY+zFS27kGGNrDPg064oC+
	on6uuMBRs3FpaTyfKKs5jguHS/155bGL1gUSO+XiShqKD9MERkta+6CKFakmortW
	rJIHhg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42721c8qkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:39:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BEdXAc003076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:39:33 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 07:39:33 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241005101816.3314728-1-quic_rdevanat@quicinc.com>
References: <20241005101816.3314728-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v2 0/4] wifi: ath12k: Support Ring, SFM, Transmit MU,
 SelfGen stats, CCA stats
Message-ID: <172865757344.243911.3525384221862153735.b4-ty@quicinc.com>
Date: Fri, 11 Oct 2024 07:39:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mb-_OD79XK_67gjFvoJpC_5fegHG8y1B
X-Proofpoint-GUID: mb-_OD79XK_67gjFvoJpC_5fegHG8y1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=604 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_073936_497246_D4B595BA 
X-CRM114-Status: UNSURE (   6.66  )
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


On Sat, 5 Oct 2024 15:48:12 +0530, Roopni Devanathan wrote:
> Add support to request HTT stats type 12, 15, 16, 17 and 19 from
> firmware. These stats give self-generated transmit stats, ring stats,
> SFM stats, transmit multi-user stats and CCA stats, respectively.
> 
> v2:
>  - Modified the API print_array_to_buf_v2() to print_array_to_buf_index().
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: Support Self-Generated Transmit stats
      commit: 44cfb7c58eb84e5f721a8950a4fbe3e5b3b28c27
[2/4] wifi: ath12k: Support Ring and SFM stats
      commit: 7e4eed987d5d5a988056496eebdf55202511f270
[3/4] wifi: ath12k: Support pdev Transmit Multi-user stats
      commit: 6f27b59af173ca03961d33970cfd2635f0ddb3d3
[4/4] wifi: ath12k: Support pdev CCA Stats
      commit: 3f5ecfc4503a9eb0e3cecbc580bd0f10332214bb

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


