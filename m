Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151A1C021A6
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzAKm0ncGdsRys3hE3TVA+b5Ix0pqeJlflqEs6F5i04=; b=UQZFjHU2cdz+0QKKmU1nYh3dx8
	mVtiMtTY87eVKC0fcnaPo/rrC/KWjtxfl2R6QSGBhPCWkb5/IlTVjYclzLuuZQrvvNWDoakxfm8We
	imI4wVETmjxrcXXhBW3R662ahUecQobM953isLjzeUi+NU2kj/g0tR0Hwldxr+PaiHFLGaPNHNvVB
	aIhUklXPDBrYFv2pCmtjLn8ufmB3uKj9qC5jYCfa0TOi2yiQNogIoMjPSJIFRI0/tMSQNvdR5yeKo
	qaaMgYaRBD1d45fhz1NRC2hmX5y7N+MsdF+jdYlxsYzi+J4kzIjyLQ6xEdMDvhjSljh7FUNz/aMRM
	GkpkllBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsST-00000004LQq-2dtp
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 15:45:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsRG-00000004LHs-221l
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B9ssND023550
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzAKm0ncGdsRys3hE3TVA+b5Ix0pqeJlflqEs6F5i04=; b=PeLkYXZ63QGyaStL
	2oyi03f1hM20SRkSau8JV8GI44YDyaEEFlTSCwRHvAaBNev8c12LNqwIg5R9hAzj
	tCqr3Xl8gKnaN3bqnYYb9Mrr6ziyBVkkbCKOT0vePPeaAc0ljeCCw44h8AYmlWxr
	Eaa+djdA/aH6wzEkAXpjZ0FTUkLQQzyrhj0rzskQsTn8n2Z6nySoNVgj0px/LVBq
	okvPUWNwF4Xjw9tRo4gOto1CeD3wialVTjmHyG/oRANOI1M/TYal1rM/6xb55pDR
	8M7WhCAWbH7Y9AuVLhzVhd8rWRtB1n+Sm+Yaq1FG8XQGvuNsOzcPhfAABjbJJZ7H
	NlBBYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r4b5s1td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21f5ae4d62dso125276905ad.0
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 07:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288681; x=1739893481;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzAKm0ncGdsRys3hE3TVA+b5Ix0pqeJlflqEs6F5i04=;
        b=mFCi5sOEGhpN8m1BxtXefnckT8wjdvnA19lrRVBMxjE5YLfXofbPmeFyVk1M0cY5EZ
         vYoU4j1GYSm9zOdJKBbfn7qQXlyMNgtj4g4zrfiu1VScrZMt23ibvnsgAPUHn9xBk0wD
         MfvekKWZPz4FBoU61AriMSU6PrJ86KH9yeRyezrNfY4gWqEl+y8IjU1TlccPEIKr078d
         W5baEZ9nPXXaw4CeXRU41eiNG5YyO6KiJadne30B6k3CfPBMVM7+uOsmGlXMY2yQou1v
         nPf+e6c5vuGhvE4Np/Mw7/UhEYCvDeOlR4PZyw5zwTMiDA7YKQBDscZQGtsOXX7Yk6u4
         w9Vg==
X-Gm-Message-State: AOJu0YwfuhlfwYchInzL9S9n3iGIs6shbHy175vipkBCLis6JZkLEeMg
	DdYWjpFP1BxYMr3kVBhLMBL2jDLbIFtnBYpzjYub5UpeHgPAUq8j1GDLc7Ocu3Q3+X2T7OHUPq0
	qiDgw9WLQ84LqyduHptbIIC6aIMDaIZ7JXRkSgvalpRrDHclv9TuahIvrV75Ffwq+GysM
X-Gm-Gg: ASbGncv1MNYcR0irbKh6wnyNWiQ2/xIZ5Uyu9mXRlVk+QBY7CtKR7a3YU0wLNfvWnGq
	ZAsgRvCvldO9q42mRntFMpX75ZSswMPJMlLFnNvL/1Ms8jpxDOz8EoLAOfnbPYjTXyvrR7ntZMW
	hOleWD/qlG6Eo1tA0M8i/UBFWAYwjQGE9NPAn1hhYjfRxL5/BKJM5PfFV0PylbBX3FpE0K27RIU
	fXECQMlu3vjhTVYII8slmjlDDYoKRFodUE3f3Y84aP8T3z0tCiGob9ATPRkNIEKFyAgGSuUAz94
	A7yQm2OihjiJMz4CNrrcF56vNZNWXqsAqbQDvJ31yw==
X-Received: by 2002:a17:902:d4cf:b0:215:6f9b:e447 with SMTP id d9443c01a7336-22073cead3fmr2562335ad.30.1739288681043;
        Tue, 11 Feb 2025 07:44:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZPv5IZQ5SfhwVLDLlnQOxxEM8AfTMWUD8+LJQm4I8WYh84SgeS+02XQHxBpTTryqm9NMNYw==
X-Received: by 2002:a17:902:d4cf:b0:215:6f9b:e447 with SMTP id d9443c01a7336-22073cead3fmr2562105ad.30.1739288680632;
        Tue, 11 Feb 2025 07:44:40 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:40 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250204064417.3671928-1-quic_rdevanat@quicinc.com>
References: <20250204064417.3671928-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v5 0/5] wifi: ath12k: Support Sounding, Latency,
 Trigger, FSE stats
Message-Id: <173928867986.1115150.15654166485225346353.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: fEGnHVAbAzrhXVOYY561BUgfk_hMpfkY
X-Proofpoint-GUID: fEGnHVAbAzrhXVOYY561BUgfk_hMpfkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=961 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074442_531055_8D2C0A3A 
X-CRM114-Status: UNSURE (   9.99  )
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


On Tue, 04 Feb 2025 12:14:12 +0530, Roopni Devanathan wrote:
> Add support to request HTT stats type 22, 25, 26, 27 and 28 from
> firmware. These stats give sounding stats, latency stats, trigger stats
> for uplink OFDMA and MUMIMO and FSE stats, respectively.
> 
> v5:
>  - Rebased on ToT. No code changes.
> v4:
>  - Squashed patches to avoid build warning.
> v3:
>  - Rebased on ToT.
>  - Removed patch dependencies.
> v2:
>  - Added line breaks where necessary, as pointed out by Kalle.
>  - Modified the use of pointer arithmetic print_array_to_buf_s8().
>  - Modified commit logs, as suggested by Kalle.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath12k: Support Sounding Stats
      commit: 5c1963119b82b369b902091502a2135b238c9793
[2/5] wifi: ath12k: Support Latency Stats
      commit: f7c5e24bb1918677f7d6195a8825b39462e0a9fc
[3/5] wifi: ath12k: Support Uplink OFDMA Trigger Stats
      commit: e669a18b20e205dc51a71a07bd3597f123979751
[4/5] wifi: ath12k: Support Uplink MUMIMO Trigger Stats
      commit: 1dbaae78e7f23819eb75f4ba8a4484e43cf625f9
[5/5] wifi: ath12k: Support Received FSE Stats
      commit: 7b19d5adadfef791d52fd0412a75ebb8f9f27a6b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


