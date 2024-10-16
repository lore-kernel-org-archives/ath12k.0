Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8820D2A527
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYFc1ODUKx6ucEPKgLerQSsyZ6FJIiJ/q582DMLb4UQ=; b=tYfUoYUfTIxVBSBqcemv9Kse5L
	ScDzgVYKgL8ry13Z9wHtqEUWpTMiqG3ZaVlWFPP8ed2c+NOPLEgNHfaOSHCjJjeX5sH/46di8e7x2
	pMdaztigDUV7/tEksQjvgdy7xm8eKRlEQ/n7hVWmFsCNX/9jw1fOpB9vkIBNY4nzadZP/VyvMPKCQ
	NiuANYiW0EuxRvEK493vULSQIGAr/MDZwZls4b/Ix29Z3/4TzWvI7sZPNr3iiBbdzqRi+JJFp3jnB
	fISWYEYc5eWqplORwfy81NWv6dwdn3kKw41yvBdrjNPgMV7/JaVhV7chziHMYXGAzMmcjZdCXhK1S
	zl4rHKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15oV-0000000CDpL-2o6k
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 15:19:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15mh-0000000CDW6-2Dhg
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 15:18:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Q3S7016952;
	Wed, 16 Oct 2024 15:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYFc1ODUKx6ucEPKgLerQSsyZ6FJIiJ/q582DMLb4UQ=; b=U3CHARydp98OxhYz
	hzdcDW7e0YOo3UNMF0lE/CIcmitSzXR5xlduR9WlqUB1kJA/9+/trfyCdf8VP8VW
	DUC+hajpXQY7GUXRV8/WfPgk6fiNve/eqEKzMj6nEc8dNJdvuyEahTUHhnhxxWL/
	FNUMo6wI+mqCyqHjnAczGdhwNoud7bLdTqVh2GX2ifirQD0NCgdQTbM6WscD6o99
	Cc0kbxjm4W+SZawIQCAIGKw6OyXq5PhZdS1eZ4WH4cjsYrAQcOPCE57Q+9ilvHSr
	gpyNZKHuh64vwqvbON6uSgID5BWDq6lZwmynkWb5EFaq9/35uz9utwLysADm9/Au
	suudfw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh555pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFHv3x006349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:57 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 08:17:57 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
In-Reply-To: <20241014065259.3968727-1-quic_rdevanat@quicinc.com>
References: <20241014065259.3968727-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v3] wifi: ath12k: Support DMAC Reset Stats
Message-ID: <172909187709.412681.433183812432332038.b4-ty@quicinc.com>
Date: Wed, 16 Oct 2024 08:17:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _Nn7PjQmRoUWQIgoqk75t6YhHvZ9DIsi
X-Proofpoint-ORIG-GUID: _Nn7PjQmRoUWQIgoqk75t6YhHvZ9DIsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=911
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_081759_732821_65B6A927 
X-CRM114-Status: UNSURE (   6.85  )
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


On Mon, 14 Oct 2024 12:22:59 +0530, Roopni Devanathan wrote:
> Add support to request DMAC reset stats from firmware through HTT stats
> type 45. These stats give debug SoC error stats such as reset count, reset
> time, engage time and count, disengage time and count and destination
> ring mask.
> 
> Sample output:
> -------------
> echo 45 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_DMAC_RESET_STATS_TLV:
> reset_count = 1
> reset_time_ms = 3013430342
> disengage_time_ms = 3013430342
> engage_time_ms = 3013430342
> disengage_count = 1
> engage_count = 1
> drain_dest_ring_mask = 0x0
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Support DMAC Reset Stats
      commit: 6c3bd9c31aadbfb97936276c14dc9aa41485a6f3

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


