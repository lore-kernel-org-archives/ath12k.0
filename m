Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEACEB8FA5
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 05:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXlAzFDeCtEXGcGZQn6kKwJe+69EJmyTwH4ibjvJF1Q=; b=K/9oiGUgeBgPI4
	W+UUDnD+yIPQCEFoz8SI7Vyg4aD9VNm55Kh3zLbcB58Hwg0l3yGJL7c50CtGVuhiOzV0foisvrgKp
	MditHBKLy1GaELrqmsZVGVE1NyY+YowY8qLXzsFBKta9LkZBHDwrRckmH116W/KdHRJBtQlE1EdlW
	dQB9S6C7Nsx1EDFrc6Yvu580PJvHH9IyeORWSnt9ZafcVfjQ/xLz8d2YgQxENaf4afZF3zkTxgcLy
	7SN72OOuc4cBdR2HQkyex/k6OiYo4EXm6eXgPrK3HJkcostXRUd1QP85u4PKSvWPLzsmCsjSjPEon
	KHn8506BlS8W9vaOGOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkv6-007HgU-01
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 05:17:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkv3-007Hg7-2E
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 05:17:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3864eNV0016063;
	Wed, 6 Sep 2023 05:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HoyuN8PeUnYwc2gm3r/5SfCpwIfosnmVGjGSJtSKvwc=;
 b=XO3mWC8tCWHlBx7kBAf5jCT0CRf1XJPuQ2ukpm1fz52168/NTtESvXwe8NPgXOIgrlUx
 MWhWxsDTretQ51vk+klwS7VSM7l/ExCyDCTY0ax400FO5vSy6EPnH1NEqHHQvU7dSNHG
 UBRlyPcvXkaDmvd6KytJ0gmyeJrbeYFoMCRgbkFGldN+W672ha8TfCwJdxTK3wX5Xdwp
 OmZAZLCbhxijP4uRR9gIPC0bqqG62z40SxGe4kd9WEIOtT0Pqmjo/aQWJ9hpeM9/uTeH
 Srpo3GGtt/owQmPfqmrKHUxKKuefirpIC4s83/FgnkIpnI8fnp4U8cfHkwsXUuFfsGV7 Ig== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sx62wsy2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 05:17:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3865Ha9p017149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 05:17:36 GMT
Received: from [10.111.180.119] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 5 Sep
 2023 22:17:35 -0700
Message-ID: <f859afc5-e51b-4b3a-9039-0da434d255e6@quicinc.com>
Date: Tue, 5 Sep 2023 22:17:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] wifi: ath12k: add TAS capability for WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230905024904.3882-1-quic_lingbok@quicinc.com>
 <20230905024904.3882-2-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230905024904.3882-2-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w2F7im-SZoAK95Ri9VkLvUmiFkVO3W4Z
X-Proofpoint-ORIG-GUID: w2F7im-SZoAK95Ri9VkLvUmiFkVO3W4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=578 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_221737_760859_7364F106 
X-CRM114-Status: GOOD (  13.18  )
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

...

> diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
> new file mode 100644
> index 000000000000..cf742958a623
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/acpi.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
> +/*
> + * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include <linux/acpi.h>

nit: this should be inside the include guard...

> +
> +#ifndef ATH12K_ACPI_H
> +#define ATH12K_ACPI_H

...here



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
