Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C10E77199
	for <ath12k@archiver.kernel.org>; Wed,  8 Jan 2025 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UadlYwA0sL9sUyzLA9rXcfvb4uS4MmSlAwuQeewV2gU=; b=WRtFwjbV1ES6iI3rZ9n3tbxQzY
	qPZxq5pnN0GkWYWuMz9sWa+IlnZsby/we3xpA+bvJci5SWvNlzurRIWaFfSEt7S/OfqlJOnLujg/P
	UYm7u7YhobxxP2EfzvhWnCt0cURKwXF72IVd/SPxsQEGZJOOYJZ6+BkTzePiREJizZm4YLDKulw2I
	dRX74MF9AYVQ2XgiEQtiTroW/9LWFrzkPkecQT0EDVN2uZ6aucbjwZnxfGtXhltxiNOJ6h0SUFYAN
	P19nKR36LEWEzOBSqTZIOXRSuXhmDxYXGWQstCP4+dsUggbdYmdh9yOMQBnbHalykiPySPre5XxYB
	L4v0DmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzs-00000006dPX-44jI
	for ath12k@archiver.kernel.org;
	Wed, 08 Jan 2025 00:32:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzr-00000006dNp-13lL
	for ath12k@lists.infradead.org;
	Wed, 08 Jan 2025 00:32:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507L6G6x023697
	for <ath12k@lists.infradead.org>; Wed, 8 Jan 2025 00:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UadlYwA0sL9sUyzLA9rXcfvb4uS4MmSlAwuQeewV2gU=; b=YFNewAcx8jIQmDl1
	OZ/Xd16UtQuOpmHHH0gs8CE+67c4/mbyZ/bo3M57GeAlftzKyiCybR0zcsN6bXOp
	FPsEHQE2dNp/Xhsfd/dlFQv+kfk9slwgHpzLAXYSKmHNgZLZN+XeSJaaLEn3/hLO
	PwvdIW/Ys8iAfHGc/86eWg0347EMfE7zh6a5mRgc7a8EO20BvJw9rxvuCsVTanbL
	lXezwvikkiWgdNymXp1XpT5tWb7om2alzwrR5IrJdaL4KVcFBZGYDPVKzBK90H1H
	GMBSkAkIP0Qie4ABejq3KeRX3+4aaapPqPZkSXZ2m0vMVohbMiTRPHyR8vdl389q
	+kOVLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441bvq0b9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 00:32:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so24060007a91.3
        for <ath12k@lists.infradead.org>; Tue, 07 Jan 2025 16:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736296349; x=1736901149;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UadlYwA0sL9sUyzLA9rXcfvb4uS4MmSlAwuQeewV2gU=;
        b=RIoCVlwZiKX66fHh9sJsX9rcShv6spc8zmnMMWJu3e/Urc2eIm6PkHHXmzNNVo+PWS
         nKHPAeE4c6AMNGPvLe13zCdTP/4PWbFv5fCobJU4A5xA2Uqua2K20IM3ypZBleiXbO/k
         KkCsbn3YYAp273lRSQw4imY6Rc4H3WfdVrz40h4jmrnTAfBrhZidNDnDwi1q444JhDYk
         fZpRujoH4kXXll9hccB0Pcj/Tcxh9b8GCt9PFZbwOnUaugbJaW1rQ2eGA+gH3uvh3182
         fdO1/cERidkxl4HzEenqy+oC0g+vWuZBgXZ6C/MszXq7ftnfdxK88DWiZYoLHsBbw8gj
         WkxA==
X-Gm-Message-State: AOJu0YzEtBeeAUg4wQWXN3OuXbfp1NeAWXUGKz7RQbDx8FGok1lhcUCq
	/ol4MiueW+/wR47le7nA6FSYJZlI9FTthA3ooLWSDHiGNlWlrFqyEUB8m3PSirHuHxCxKzBrCiO
	ntFmWggaNqtk9EijQwJ6IdAOxRP3VjOR0N4gyJHE9lU30+qYBrnPL/8/lCslF
X-Gm-Gg: ASbGncvAEvFRm01vt4kcy4tmPQPRVffqEx5IQTMHfuBDhI1+utESw5swFdZMmZFAOG1
	sAbx34QR3j3C9qO+yJiYBcp4d0w7mL5kDcADihhS62Y4uC4WuLY/JFomWfJtegJLNMpU08+WUjs
	m9ICfr+GqzMfgnqqwXM7Mhce2c0huoGxLVh6n8odHMHI/PmG9GRv5TQrluSA4TL3S6WdkRX/5Av
	yXwSsYrjUlkIJl+aqI7UU7hbi6qmrEgZvq6CqlPZszm/wDU5LR31FXtH8fb7FEOiNYvULwo9xBO
	z0pV+ecIwMTljHMzPA==
X-Received: by 2002:a05:6a00:884:b0:725:8c0f:6fa3 with SMTP id d2e1a72fcca58-72d21feaa9emr1379264b3a.22.1736296349068;
        Tue, 07 Jan 2025 16:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvyWQdk6FPRYvA5K948NruwDsqWhJPnsVBRzTmF4BXeD/fy2984BhbwQfxLL0TRLokUtS5Gg==
X-Received: by 2002:a05:6a00:884:b0:725:8c0f:6fa3 with SMTP id d2e1a72fcca58-72d21feaa9emr1379231b3a.22.1736296348631;
        Tue, 07 Jan 2025 16:32:28 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm34041162b3a.116.2025.01.07.16.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 16:32:27 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Santhosh Ramesh <quic_santrame@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>
In-Reply-To: <20240909073049.3423035-1-quic_santrame@quicinc.com>
References: <20240909073049.3423035-1-quic_santrame@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
Message-Id: <173629634735.3079396.2749776336139001746.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Jan 2025 16:32:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: -vfk6PkCNW5OHslJjn-vHouh6_ne_Mg9
X-Proofpoint-GUID: -vfk6PkCNW5OHslJjn-vHouh6_ne_Mg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_163231_413720_6799C530 
X-CRM114-Status: GOOD (  10.44  )
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


On Mon, 09 Sep 2024 13:00:49 +0530, Santhosh Ramesh wrote:
> Currently, when the vdev start WMI cmd is sent from host, vdev related
> parameters such as max_reg_power, max_power, and max_antenna_gain are
> multiplied by 2 before being sent to the firmware. This is incorrect
> because the firmware uses 1 dBm steps for power calculations.
> 
> This leads to incorrect power values being used in the firmware and
> radio, potentially causing incorrect behavior.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix tx power, max reg power update to firmware
      commit: 3540bba855b4b422e8b977d11aa8173ccb4f089d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


