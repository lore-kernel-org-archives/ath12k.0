Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F9DC02185
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsGojtOFEULy7YGHzEEe4iJo5qMCszRU0RKFvHXchFo=; b=vl7loSrKN7iZm3DWdXdWYoMgGp
	C6ZjzLdayE6NTWJwpHOEr5tKt3mEPD8YoIqnQHwJ/x8IiYpO0beFYwU2Fcuyah8YY0YfaDefaHuSZ
	yqBBI0sqGkVbjrDesE+6eyiYFh8QFn0fXxoiNA9il0JlnuPr+r79/0gZkZcVRJVWxvAQ8xZyeU3u2
	McT9/52GgywiSqsRL11y0iHvV2pR9GD/KjOjG9C08mlQb6UDv9WByxrPT+Faa8YkK5qSYXoESfU7/
	fWNAjKc5qiNKlIBurr+OiZzaHXAnJboaafb0q0vF1GIBbaGvhYIcCJGrD8wx3yAuWe+VswtBIkchX
	FiAYEZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnxh-00000009kdk-1JYz
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 20:56:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnvc-00000009kFI-1cV4
	for ath12k@bombadil.infradead.org;
	Tue, 14 Jan 2025 20:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UsGojtOFEULy7YGHzEEe4iJo5qMCszRU0RKFvHXchFo=; b=HYcKTBpIQUMW1XsvFfV2opZhWY
	OX+ulMHGV11hvWqZ2dNL63yM2lum+poESehP5USHs1vFW4zPwp0i6cqNGYAU5CKy4wb96kaJqWpRY
	7krBsC0yDXjd/tJhHYCPJfyti5cdPWK/PNxu3Ffeapqp2TlY7yUM2TSuepQyF13Won8QqWiGfZzaV
	/PES7gpbp6sAgGdIrjaJKUrAVrfUoSM/EeolHAod3SfmFqlm8IGLOG4ekxo2nE16Jv88lftLYVq9M
	B34b2OmSkI3XQBuJJu2x1PDE409YF8H5Z3K9W9Mi/jZQIc6X+NJPBK6DlXx2e02yLnvlROqCB6C23
	x19rlNWg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnvY-0000000Ad2f-1Knk
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 20:54:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EGjiTC027503
	for <ath12k@lists.infradead.org>; Tue, 14 Jan 2025 20:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UsGojtOFEULy7YGHzEEe4iJo5qMCszRU0RKFvHXchFo=; b=WDRfGmUkHbWQtvhj
	SHq8zbfPS9s9cqauj3wo+l8bWheBS8N7Evge15rjVl5VeyEt4sk45p+6lP92qNTI
	jCPiRRIHqoqSnJ1Yjqd7+Uj6DtzPJvPhGJmjCxovODNbbVwjFGPV2nJbm8p/1Mq3
	pomOaNRaOwW99YQfNxFSfaGkMbUX5zPAp6XJJ+pLf0/733+09PNI25rX4IyXgVKV
	koshCWPqloUVi4X/SwANJu9TQhlSpj/s+E/O1vsRE/gZZJN5WZQ9dcXpZA/ZaiNb
	dlej5iSMh81RNXAnABm29Gmotno1cPmG5iSgo0LQ6tiud808YGD5O8OLR8Xoc9rG
	ydiqJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445uqsgj45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jan 2025 20:54:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so10108859a91.1
        for <ath12k@lists.infradead.org>; Tue, 14 Jan 2025 12:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736888053; x=1737492853;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsGojtOFEULy7YGHzEEe4iJo5qMCszRU0RKFvHXchFo=;
        b=JHiQds0iYSEoOjyugxoXqYkbZQjI0yPxUquC/z0oyVF1ZGZjSTn+UrKrWeScknPy/B
         8S+SN8fSC3pDPVTrL+xTjrTSm0y6YAIfRgfD2DwH6Mee+FyEfY4/kUwZZJXD5ot9hW5y
         uOMCed4L5MEZ1WPq7S66Zue56KBtwL/6epH3374+iiVjSX5v4bFpPW8/G98Q43JTrv0r
         grJ8iJl+DskcGgM/3I8pOdm43Blvxg/CIfjCfqhOO0H0J1AN5nct/etEZGXaxGJeq3W5
         rbMjk3y55OCuzw0lPa8d5/UY6spRFlHdWObFmqLAtRMvtuNyhV74K3A4Y8KX5Kxzhqc5
         7NQw==
X-Forwarded-Encrypted: i=1; AJvYcCVSNrZVxJczwCamx1ovZD6z+XGPP5oDQF+JMBJryw8xyUfiR/CPPH6FDyAk1mAAv1XrcB/QxqI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzB8QeS/vuLt7/M2Sj8xzCzG5uJXiZNeqmG6SZdj1t19zAwtnC2
	QKmxcHMQKdtbA5cHcwKA1yYvLDdWyHxO+uUpspu3NfowGCZU5eY1GYGyTju1BwdRYN9a6p7VAAo
	aW67Dg4mByal3V/1A95FKYeGoFCsSPl4/XhR6QalU5KzloJyNikgp/UpO5CoS
X-Gm-Gg: ASbGncvLvg09kq7LQoWaGT0WTzjsBuYOMWoD7/al9D5ldLMneTq2x+leKqxFo9ylJ7F
	1ev+jBnW0qxUI2sDYPd8MEgxx5T2iiLucpmVJ5gjSCNkZTxmGtg1yObk+NAn+TUWL0OcGilaBE6
	iWvGEW4L+WFmO1m0D7Fk4tRTJigkWBzIdfrkQSdcQARGghcdFEVVqh2HYvxJhgeDlfEQZ89XO8I
	JH/TJpxmY/gkekyKV4pWpcLO+URX/3Xyg7rD0m09xSzHiZLQWXmTSpXKNC6DNIcLNhPO/gQv9He
	IkkueZIbELBrj8n/qg==
X-Received: by 2002:a17:90b:3d09:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2f548f33baemr37686097a91.13.1736888053393;
        Tue, 14 Jan 2025 12:54:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3Q6cjDv86VHBSJQbf6mRungfVjqpXQq24MQV4+1KVUXwek7Jt6hoJRKWSdA2ql9T5nYr9EA==
X-Received: by 2002:a17:90b:3d09:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2f548f33baemr37686062a91.13.1736888053069;
        Tue, 14 Jan 2025 12:54:13 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm12138463a91.31.2025.01.14.12.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:54:12 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250112-fix_key_cache_handling-v2-1-70e142c6153e@quicinc.com>
References: <20250112-fix_key_cache_handling-v2-1-70e142c6153e@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix key cache handling
Message-Id: <173688805235.2759377.5453459200658358926.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jan 2025 12:54:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: esAGdyAduMcSIJUtrIJebjdZNDG9J3U5
X-Proofpoint-ORIG-GUID: esAGdyAduMcSIJUtrIJebjdZNDG9J3U5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_07,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=971 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_205421_113533_332E0928 
X-CRM114-Status: GOOD (  15.48  )
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


On Sun, 12 Jan 2025 11:23:00 +0530, Aditya Kumar Singh wrote:
> Currently, an interface is created in the driver during channel assignment.
> If mac80211 attempts to set a key for an interface before this assignment,
> the driver caches the key. Once the interface is created, the driver
> installs the cached key to the hardware. This sequence is exemplified in
> mesh mode operation where the group key is set before channel assignment.
> 
> However, in ath12k_mac_update_key_cache(), after caching the key, due to
> incorrect logic, it is deleted from the cache during the subsequent loop
> iteration. As a result, after the interface is created, the driver does not
> find any cached key, and the key is not installed to the hardware which is
> wrong. This leads to issue in mesh, where broadcast traffic is not
> encrypted over the air.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix key cache handling
      commit: 336097d74c284a7c928b723ce8690f28912da03d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


