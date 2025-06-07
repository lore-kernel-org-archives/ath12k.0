Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E10EC61CE7
	for <ath12k@archiver.kernel.org>; Sat,  7 Jun 2025 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKP57LtvpN0o4j8981kkmloCcGjwLJ5jDT4OhefdPHE=; b=Z4l5mhaQNtTUi86UH6z/d7w1H5
	+KdzkW2I4LT846kdvq9PROX6AlCiEQ/9MjGlEJk2aKvb269o9e10Ut+OVtoeKS8I4HJAV/7TemslG
	TQzXI9scxo3lm0/GMmBcf2S2POINmHckSnT5TV5Zpo1J8Z8TlcywKohULcmW2aPfBPL6Od1tRK5PC
	j4XHTKnZXNeasPf9aV5CfZkzm1iP4TlLsgt5M/sVc6WlVF7bcEL1wvvgH3otQV7dfqXmiYIDnSa4c
	SkTgMepW3Gi++dM+juEUAJT44MZ6nkJ1OTUSehvgqBPQN710/BYZvADpNArDZLjeud9m7U/xs/R5Y
	t5J4FB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumI-00000001mRi-0qbz;
	Sat, 07 Jun 2025 14:44:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumF-00000001mP7-3vlR
	for ath12k@lists.infradead.org;
	Sat, 07 Jun 2025 14:44:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574DqK5026956
	for <ath12k@lists.infradead.org>; Sat, 7 Jun 2025 14:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKP57LtvpN0o4j8981kkmloCcGjwLJ5jDT4OhefdPHE=; b=Kgy1IkXrftGxepmr
	uc0UArS5i4wrtrf5FZ3Sm/GsO5qk+5F09LCIaCgGbzM1ItDk12kBbnbVOOl/aoG9
	7492EBodHH5H9qU72eshDI7rYFh8C1oOMCzXBS7Hfko9C6NdD+mJGn8SchsiPyAQ
	hwdsQdW+VLrFkbdWX5sa3lGMsZBmlMNjvpfxcvvYTng3PTJB5dr9AWeyC+UkYBVz
	BzBE9kWKBg9CaF+i2OBtDDm9ExgWxzE/jEUW/E/kSyhM3QipAVUywAX0FToW33ZM
	q0QFLrep/xGkK9xm2yxMHC1r0Z7zeX/RWtMCrmj8loTI/03/F7Xy6Q7JSFMJP2m7
	4qAlPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkrrsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 07 Jun 2025 14:44:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23495f5924aso23661825ad.0
        for <ath12k@lists.infradead.org>; Sat, 07 Jun 2025 07:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307446; x=1749912246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKP57LtvpN0o4j8981kkmloCcGjwLJ5jDT4OhefdPHE=;
        b=VtIaeYV9je3nwjDCfsoBxUTKz2qCYufEFK0W68uh2/ixfXSHcea7bg/RAoUS3V4IMs
         wWsqjnbJcOCy8wpsxBm/abSlIubkzp8ORNpmiH+x5/NyJIue577NHvCSjinHdjBqpzwS
         m02OlRQ1YXVQjGibb0VHe9FmCHQqEPxkluENV15AIivdgjbU+FyIGvsNe19CJ7SXxVUt
         WV7yQ6llR6Uaq1cZl/JwRLD0QDc5k+QRMmJeIuof8FjZe1gKvEJ6uHIAl89a4wu5qCkL
         krjM1ycKhaWPDQb/Kw7osoruZh0FyNpTM/Yv8Z8OwzoL8I4VYhKGIcyO8Y5H7vwzohk7
         /t8Q==
X-Gm-Message-State: AOJu0YwpvMEFmAddttvpb9GtRtQel30s7bcnoj04xhsXLXlzpZvoZ464
	4DjjxQ3MuoIZUViqMwED2yFYiAJXkk89B53vbDoRJrtQMTdC0q/gAxU1m97WCbyT1oEVIIOmlik
	yJBByWkELMgWI5p3C2edCPl2VgKo03r93q6dqfTKEX5rqlF+NMzr30S9lLqlLpwN6
X-Gm-Gg: ASbGnct3zAPVgz/RtGt9xADGm2fgXu5VWs0lskA5WReLg1esQFaluIDRKbyvsSPRevz
	aQWG6fBtTjNJpHqeJMWSLWQ4Tyabr8P2OErCYuhJcXoCw8WjJFcPjGhW1oP+ueCPpxoeSkv8dbW
	Xe1oFkSsh6EloEWqIZPaw4g5Jvlb37qqw5u89y427OYjeNC69L+HBy6V5DazkGK7RnOGdFvVRoL
	vrtijcTkVyg2jpYVyLjlT8qqO1C4fi7gf+hFChUmJjb/GdvB4I5uP7IWBEyTn0U1ueesMZSV4kD
	Mkx3QDXYH4EoFqxA8JYiqMyQn8taYMHDCWGYGFfcjhMiPd8Q
X-Received: by 2002:a17:902:e890:b0:233:fd7b:5e0d with SMTP id d9443c01a7336-2360204e078mr98779195ad.5.1749307445913;
        Sat, 07 Jun 2025 07:44:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXJtHzI0iZsOHPoQDPNghXFBlVaVQi0Q2yp3wgPLwZoHZhFseuzZTHToiow1f1iVUEDMUQng==
X-Received: by 2002:a17:902:e890:b0:233:fd7b:5e0d with SMTP id d9443c01a7336-2360204e078mr98778935ad.5.1749307445571;
        Sat, 07 Jun 2025 07:44:05 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:44:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com>
References: <20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix uaf in ath12k_core_init()
Message-Id: <174930744425.154748.15678214019639234293.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:44:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=68445037 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=SO4j_8h2HUBQMcU2vEcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: T9B4tU0gpTFqyUZeJtpHhjG8Cx142lQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfX+qUIBkzAeF39
 qIJkQ31Jt/UVnqgZLlZmM6zLQ1ZogIWREuTZn1cFvty9lv6KLt5aDsQMzDGG65hJxN4s12a4Jw9
 VgzSsnBEFRcLdXlAxhAk7CUzAQ/me7gunV9Elq1TB4OWoPvhbbTxOcHkHhGAnLx9K71uANnRM+E
 a7jL7e3mRFfZROtWy0KyS23GPdk21p1WrSEav7l+u/WfZQZxwUdTSFA3phfJN1LKNGl25pmRYaK
 s2zVGwf5HPM913fd6DOmbzJBGFsOBRurUKBTF4i+FG4gxOWm8+ZxuqRBuURQ/jXnPnXFDNV5cY0
 3K0D20BjLlc8fWojd3jBWixX+K5Hh/8MEhzKd/l4kfhezofvjTr19I/syEDavaSqhJ+hgARbBt6
 XyVZ8YjzNjJjoqOIgJq8miXHMUHln64lcL3GnnAmAW/WL2Z8+LuJo/hAKnN+dll0an+gue42
X-Proofpoint-ORIG-GUID: T9B4tU0gpTFqyUZeJtpHhjG8Cx142lQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_074408_109368_113FEAE9 
X-CRM114-Status: GOOD (  10.97  )
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


On Wed, 04 Jun 2025 13:52:50 +0800, Miaoqing Pan wrote:
> When the execution of ath12k_core_hw_group_assign() or
> ath12k_core_hw_group_create() fails, the registered notifier chain is not
> unregistered properly. Its memory is freed after rmmod, which may trigger
> to a use-after-free (UAF) issue if there is a subsequent access to this
> notifier chain.
> 
> Fixes the issue by calling ath12k_core_panic_notifier_unregister() in
> failure cases.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix uaf in ath12k_core_init()
      commit: f3fe49dbddd73f0155a8935af47cb63693069dbe

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


