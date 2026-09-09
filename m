Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0845EC79FBF
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVSiJVg7iYewYL7oMPCyOTblcroO6eMx2rR2SaZTWqQ=; b=idCCycMRuMTk1dE2bx8PykGMwo
	X0mLWv7+yS84BNRwyetl729PqgAN6tyQZ+BO9EVlW7UgxvPPMRxE8FHZvuefwTFx6Beqs9Ntx+dYa
	jhk5DzlA7WFz1t7dvL1+o2To1QMixHhQYFUQDW2VqrXEkJ1iRvW5B8u+NO/3b05YyizjoAC/2vSo8
	0IbBZSj/RhCOQdQu5QcNOuwI95Z2tCk1N0guSSeorvb58wnJY4q6GUsrIL8Y9EoVNA7iUvbwCpo6M
	JXjKI/YLNDjHpL36+Lxz869qtT30wE6QxhOybNG95AarvbJj3jqbRtWo7BT+NOr+k+B0Uq8vHAghf
	22i+o25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYU-0000000CYQv-3572;
	Wed, 09 Sep 2026 17:57:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYR-0000000CYNr-3K3M
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 17:57:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7adH2065392
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVSiJVg7iYewYL7oMPCyOTblcroO6eMx2rR2SaZTWqQ=; b=SAE1JLhUdRfP0yFK
	M0vuplRk083yCO9ycP5+uYllzmFsUQRnA/BVpfkYyjLQk0Xk8CaVya3UhHqHamHZ
	lNVZTikzuLaLcx04hsbpxXq9KRa3ey2OlJRlZ69lcLcjslcJrgJHuhHRAIjGhqkP
	B+ji+pV8XqJQTgjTf+Mw5ODg440TIjxQlRlrdtuzGeM3ZhkfvQE2wKgrMXXpJp9u
	g1WBBc+tjioIyGzRyD5koox1fkFvqNyAROh/nJWHsoWDL2VdYStohXHfPT43ngVy
	6SSzH8o8ml5Zbz0dQAnVHwiwzLuNTRkyHCTaWVJO75l9IDkM1tHKbPAYOboNuZR4
	ENyL1A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x1p3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so4840108a91.0
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976671; x=1789581471; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVSiJVg7iYewYL7oMPCyOTblcroO6eMx2rR2SaZTWqQ=;
        b=KHKSjC32rLmLBrhj1/1eyfK6nPOSlWHSmJL4SJvSda0xoQ6T3YlxTjWV7wNSb7GYd7
         r6rXFjMuN43tAulk6YuS5NqZc2Ul4rkzlZpQAMt2KuagEFKCGzDl9Gtt2WhK4uCAXVjY
         ZpSHHhYgpIHhL79auBBEX/mUsjqdqm1QXDv0p5SvsGd1iTJOMjtC4JTx66OvWm1N99Ks
         3uFltS2heLXwqanxQuC18lj7tOLKZD5U42M4Txs0R4jI1mhKwopf5a42jQQsc4wRZd6p
         FXapxtcQF2ykl97jHBayJyljsLc2sYvt4Ta6Hjfo8xq3kobe08u/4uOGmb5jVbGTVSo9
         CJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976671; x=1789581471;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVSiJVg7iYewYL7oMPCyOTblcroO6eMx2rR2SaZTWqQ=;
        b=ORGKl7p4GhGgMZzISMelVFypOKhFyqSp+kKD1/asbsW7v/uG09hf3WAnB/qvDR8436
         SBjbx/0EKa92xGfnASnqyB/2bADtuMYyMxU566KtaTeUsBzkHiPHImVuFTDBYKub/Yeb
         d5pInR8e06ENCB5npE3g5BswG/t+FDVhQCOF6IVSTdRluf7BOVWDgbVzHemIc7Z7texG
         kgHzh6uPE8DyMEiZCq1Aeh8sOxE6OR9PwlHU5xxvvynVYMfl/jUSrP1zxnV0uFykBbU+
         ub72rwUYunQNS/0qDxVO7cAUoskZ+W9XY7Ju0F0Bwfmb1dHsjSwqqeeWReQPfRv3b1sf
         Tg4w==
X-Forwarded-Encrypted: i=1; AKwUvBxqULFRnz6fx4HR5oswzmkOZakAs1c1UDBBQBIFeTqGJK4SKypgKJiFK4MQ7P/t/XzK1jqjCKc=@lists.infradead.org
X-Gm-Message-State: AFuF++ncniE5C3u13i8NBgEzCOJCtVF9h//BDPqUZEUPEHHdq7A4hIOX
	XGuh+XF8eg6Wpzco/8zEizdOGFMVxLbHlawdYw1P1AF4I26QK7RtIyiT4FHccfUyuR8s1af1nvp
	9qqallkjYnMEe1vvHygCCtG1pX9OIqvqHqKOwDuFOGjpwLIbxkLr/VJjsfi4J6OUN
X-Gm-Gg: AYBFou2n89RAwBxWK/kP5vXaUVRJn+1OimVYa7aSLnI5wmULD0UqQ2WghxnuzVawoMi
	dKt68Xb9BvKrNCoVrH7QTJm94NmjkvIqy61VUHObJv0i1SLDKzHj16cGod+GHCIQn773wNcLyYd
	8cDbtfB+ulN69MQQpGQaeowD2n75ngXnmHhmjTuVkr+Kygp3eUdvmi2KSSEQwGiwNomBjZSKWKw
	tRyUUxn5VU28PKTuGn8ZVB4PP0a0caUZPwXWTN1YuDwQIgs3ZbPdLfWwig33liQhzMn8FmKLv13
	ywngQIftzXqAlIYra9TRhP0dpAmmZU+irmuSTXv6KriSl12opiRUpB0L+VnjiVPin6WU9I1fAfC
	ITduEEYlkHZkNVmJr7OaA1Jk2yq78195byO+I9Ke2ot3WkwtIY9Tc+70=
X-Received: by 2002:a17:90a:1c96:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39b66ee3442mr19656029a91.25.1788976670643;
        Wed, 09 Sep 2026 10:57:50 -0700 (PDT)
X-Received: by 2002:a17:90a:1c96:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39b66ee3442mr19655977a91.25.1788976670182;
        Wed, 09 Sep 2026 10:57:50 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        P Praneesh <praneesh.p@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260813-ext-msdu-fix-v1-1-c5e80ccd061a@oss.qualcomm.com>
References: <20260813-ext-msdu-fix-v1-1-c5e80ccd061a@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: fix DMA unwind for ext MSDU descriptor
 retry
Message-Id: <178897666910.2048605.5900469756207740270.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: xRxqdDzZCEtI_virVQeVqmXdq7_2XvzX
X-Proofpoint-GUID: xRxqdDzZCEtI_virVQeVqmXdq7_2XvzX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX39t/Ik+wlhzY
 BQ3PE31EqoLLlKYnYeFye5onAkxX4yYN6d2tTgpMLVcylwK2sA8CjuANtnCMCoenKGkOUSDIJKd
 IKPfekcGKcOMfqMKWmSJvn7knJ8b4qg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfXzi2thcUwbnnb
 mBBGOA/eLvkRAjwnXKRN3TzKOvEufaDj3aALmEWDN0EGp9bCqoIwvrRFrtohRAAnX/i59bYCyIR
 txchy+n9WoQmE4s1Cvoc7atRHFVYnbIZnwhKQ2Qz5Ma0y3AER9btuUm8irfOMD19PbEhc3/6mrV
 dH8uXM2qx0F3HuOaS54n7KbKFr0mbIW7c2xjRIDt59Hdx8ZuEDTTDMCkeNBu1TEhQFnW6TdKn9d
 nOyDreNM7O593QrdrXlZCgNh5v6TZra+Rrij4p3QtARNc4UpxtS4iATAnh3nTmLnigzfQ5+W60C
 CpZanytbS/Li1pmJ8W+eEtWuU3pC9+KtqLc0oOnbkzhHyCriL5S5yO+/LHXGQWY2XEUT/KX9vr0
 gERU7lBcWSEmSAGGjOh+3dYSXmvtWecMEBu1E6LsIXWPTUTA2Fre1hKWzuofQ1/Zl41tdRy/dEA
 0Crca7BoBP8EwGxT5WQ==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa19e1f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hShXsiTv-2AdAf_wJi4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105751_900487_B9FDCB56 
X-CRM114-Status: GOOD (  12.28  )
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


On Thu, 13 Aug 2026 23:09:20 +0530, Rameshkumar Sundaram wrote:
> ath12k_wifi7_dp_tx() maps the original MSDU into ti.paddr and
> stores the address in skb_cb->paddr. When an extended MSDU descriptor
> is used, the function later maps the ext descriptor and overwrites
> ti.paddr and ti.data_len with the ext-desc DMA address and length.
> 
> If TCL ring allocation then fails, the error path first unmaps the
> ext-desc DMA address from skb_cb->paddr_ext_desc. It then falls through
> to fail_unmap_dma, which uses ti.paddr/ti.data_len for the original
> MSDU unmap. At that point ti.paddr still refers to the ext-desc
> mapping, so the ext descriptor is unmapped twice and the original MSDU
> mapping is left mapped.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix DMA unwind for ext MSDU descriptor retry
      commit: 4de5a8a0edddc453f1a4c93b6d9f09013a23b72e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


