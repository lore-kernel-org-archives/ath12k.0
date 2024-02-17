Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F17C48BC4
	for <ath12k@archiver.kernel.org>; Sat, 17 Feb 2024 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tGSb+OxlOFLfZgDrZvbPGEeFo5YrukPOxyq2xmqLWS4=; b=izkMbS1v988d44
	um68C2jS4gauDZZIZvqXj/nExVpItyjxxnHXROZ1A/0yc6+9ogeXk65Dd4vQsGCcX454jKLemj8Fi
	dKvYEwE+7x8XVXnmUtK+xI+efJKladD4F/EaXLXjcIXUwp6cRXmI85iDGuuVd+9tAeh/aPTEpFEnj
	fCk6O818Kjj5QlJRwB2FbPND3FOtHFh9DzZxbAoemMIL4k2MyS7rnBkdPoGRECi5U8TFuz3KxUB5M
	BiY5yzd8kRy3fhElW3WbsqHsknrMT9ifIjyX8FVW96AoSd9reGAjpJmmVUaj3u9ZcPpP/KWR9J9zr
	inVcf16KAWfyUAbbQbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbRb2-00000006NGc-3SMz
	for ath12k@archiver.kernel.org;
	Sat, 17 Feb 2024 20:47:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbRay-00000006NFJ-0A8i;
	Sat, 17 Feb 2024 20:47:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41HKdKBC018686;
	Sat, 17 Feb 2024 20:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=tGSb+OxlOFLfZg
	DrZvbPGEeFo5YrukPOxyq2xmqLWS4=; b=YpmdmJiKqRPvd6FZFHo2rgnl6ds6I6
	Xg/V0ClPNNCSDtk9FT41NCkGi2JTIst28be5pepIkjlSm25KSdE2JvbbQN08vhcJ
	N2w+Bpqva8YXWMsqEjb9SLr8POvMg+xPLxmtuRWuM9iJZXbJv5tVvbjC5POftMFs
	cw8q9K4FDL6Q+VhlwCRuaDr9/6phE04SSxSUWXuOV8ce7RfvVjkuRsZejIEQ7YHk
	s28h1Gq/aVsiwsbR90q6dKulk+MGvm5joNS+TeYePkYwRY4QywArk2Ua+kpzQ+xp
	NiDnBYoyHn24L5bOqE102RDRVuDfE+ghaKqqcsZjaDxY2gltvHWX2/LA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wanys0v7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 20:47:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41HKlVp7014388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 20:47:31 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 17 Feb
 2024 12:47:31 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/2] wifi: make several MAINTAINERS updates for
 ath10k/ath11k/ath12k
Date: Sat, 17 Feb 2024 12:47:00 -0800
Message-ID: <20240217-update-maintainer-v1-0-1426cf7a8bb1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQb0WUC/x2MQQqAIBAAvyJ7TlCLzL4SHSzX2kMWWhGEf086z
 GEOMy8kjIQJevZCxJsS7aGIrBjMqw0LcnLFQQnVCCU1vw5nT+SbpXAWMHLjTT2ZzohWWyjdEdH
 T8z+HMecPm4udXmMAAAA=
To: Kalle Valo <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5Azelj6IIp0FVcM-dcRXAL0D1pUO9bgh
X-Proofpoint-GUID: 5Azelj6IIp0FVcM-dcRXAL0D1pUO9bgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_19,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=274 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402170172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_124736_121278_5E1AC68B 
X-CRM114-Status: UNSURE (   6.15  )
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


---
Jeff Johnson (2):
      MAINTAINERS: update Jeff Johnson e-mail address
      MAINTAINERS: Add N: ath1*k entries to match .yaml files

 MAINTAINERS | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
change-id: 20240217-update-maintainer-9f93b989067a


