Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DDDD2F33A
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUL0yqDwzJToWehueELfVYVdUh4bbVBhzmAExFw29FM=; b=AQCY+zrWZzRB5sBL4ukoAOBCWl
	dcvSF2wpwAFeoAZe30HAQceEg969vO+zynetg+n0iUz50YciqsHsbZmNVvD1zONXksWpiuClRFedV
	u1Y2PTuWTwie+ZCFgxAUw6gI4e8fLuwUHl5rGu4nbgR5D/FlZSaFjqFN9Tmd8+m5TJ3A7ZcfnsfC/
	9XjVN/Plc2dsXS6PNTzO50XKnmXUVvq7F/v5/36vUHF62pM53wvqX0CfAN5E4ToRepnIfpk1qtcG4
	mwGxWHJ+aviSgds/CAWqqfEBbJI4+r0bg+bQ7SoZXBqOj4EfMhCZzeV6YQrTHzbDqLyAIo5Ze29Il
	4FtovPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgKr-00000007NLj-22xf;
	Tue, 13 Jan 2026 15:29:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgKp-00000007NJy-0NRP
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 15:29:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DA5s823799057
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 15:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUL0yqDwzJToWehueELfVYVdUh4bbVBhzmAExFw29FM=; b=LZ7uPLtYuzW36/mJ
	ARITQAuNilfAPg5qx3z3Jl7yGcrT7G1pl+ZC7pGGbs+TE4dVpXss99hfUw8g2p5W
	vVywFcRpzhKrXVamtdIimiVHEawNFWhsXTutDwmRhgfblHLVTnfzGhDlGdHsplFl
	JtKSydaw/2irTEens+ozNvewqw0/PL3WpvSVGtUbVBZErjZSeP2z1xb+FP2YwMDW
	fnFpSyWjLuFGTKeGp3CbIiUMgWk4uvGv8pMQLbI1iAx8syv+FMcJ/3LQFM30iH8w
	t84FJdFDC7RpD86Zbyvvv+xJ+RBd6UlarlB6IUEVOW+Fw5bBClJxjw9rlgAgczLM
	eTy59A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0ds0f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 15:29:30 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11f44c1b352so38378844c88.0
        for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 07:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318169; x=1768922969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUL0yqDwzJToWehueELfVYVdUh4bbVBhzmAExFw29FM=;
        b=TZPv2pprIqnlPVkK48v+v5TrbucAcMAt662giAKHlHKyar//hrnOfDZVlkeP7Mw2sI
         G/Up2QDAdMQRXeOA+Aohkq9/jg5kOIB3bfgCkqWW51qFqxSZz1oSB8TyDe+zW/UnDC7S
         hSx+kMDZA2tuUe88DTGbj4xVPFCUs2w//wwGSrIGnmZoTkcmRgcoxDuB+bbPc48jV4+T
         q33kNyDJ4TQpzbtSf2qBqCcEzxa13//0mxyiBfi0P4X8iRNHmbpDP9gD984i5HHxpBWR
         FfFhsg7ilyZ7vOfRM3YYEoV/LX0k0yEnpueDqtSvH0tmN2Xpz+guGRkdgznABcN0zcsa
         E9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318169; x=1768922969;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tUL0yqDwzJToWehueELfVYVdUh4bbVBhzmAExFw29FM=;
        b=UTpIWb9LRyE3FufzIPRKu+T6So7Kd4qUFTt3vLVSd8JVm8yvFrvDK8yQOjNBLI13cH
         hOaIjWlRd86TcKKzfKrPD2f85VzbXHH/YyZjnLuurD3nJq6+hoXgT8HtjpWYHcAUXNLM
         sU1sUSHbd9DvP9DhKo9zAccGY1NcM8CS8OLHof9PWOkh7H6Qu/7rRLqAgHW5Z012dT97
         mhWlgStCQOKBimXNzDnjFTLyqcUBz37T0z+OWc9KWz0wZJ48loJIWAqB8tk1ONdL/wb5
         1P6/0QWEbhCRgdmoZOgagsqL/wxKKx6Z+3cwTbBBg/0zaOzPgR/af6Nf2PtgRqzMVStR
         G+8Q==
X-Gm-Message-State: AOJu0YyNIsQ8qB7GSnUwOdEaov35Ydg28iiJ89C32kCIIk1jj2gSAgRa
	kCcxqYd8IS72wUKFgLCfWMJdMpymqUwiI/PJEaJvX/t4GDaXG3HKA9ipVxN2urTBOFUb1mXTGIS
	Y5J3X9gL2uqTLLqCvFOrsdzvAkTHM3LaOAie1I5po3I+hgi9JexGsSwUglIOikVD6dRNWdnqP
X-Gm-Gg: AY/fxX7NytqhjICd8ESwNB9DEyHVfmlCX/9701tfixppAVq5p9m5BcAdyTQIP+nXZtC
	wpfz+I5vM0eFo2l4AI2yJ+5RwcPNDXuT3OAn54V/1RGpf6k6EbuiQPocd6chaDOz3aLhAsDJ/31
	fMaGHe2A/RnjwqlqPHHjEtpj+P+GiaoFjVDLDWAjl6+XwitAkm2h94FzgGZ5wNWiTScLD+7oyKp
	MVtN/v63mEpr6jxxaKzzVMsPkqnJvQmk6DdqHah7pF91Iughf7n1NZcTXfJ17qEHyVC5i03f8ko
	hm3FrTteehQkEzjGJqS1l8wCLBZ2JJNrgoItnDNxL7Fcm/L/yKcQdKgK8jHGVv5iBP6A6XAaLU9
	X0Vc0MYuxSNk2MRL3crNMm2PER6gsDtOs64m5hVjwgza4j0TIi7zJNwITzQZgwDoL
X-Received: by 2002:a05:7022:5e05:b0:119:e56b:c73d with SMTP id a92af1059eb24-121f8ab9cb9mr15686819c88.2.1768318169049;
        Tue, 13 Jan 2026 07:29:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGywGTzJ3xRI4VOhiiPcaXXwGSVSM8e4aHZ5XPdS5IBF8/W7pj6krLdbOQoORp/mYe92uphHw==
X-Received: by 2002:a05:7022:5e05:b0:119:e56b:c73d with SMTP id a92af1059eb24-121f8ab9cb9mr15686791c88.2.1768318168467;
        Tue, 13 Jan 2026 07:29:28 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm16858049eec.33.2026.01.13.07.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:29:27 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
In-Reply-To: <20260113054636.2620035-1-yingying.tang@oss.qualcomm.com>
References: <20260113054636.2620035-1-yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix wrong P2P device link id
 issue
Message-Id: <176831816777.3453943.3207053910336933657.b4-ty@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 07:29:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=696664da cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2Mo8NHjUZIvW9bQ8WxoA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: gSWtDhsTKst9_FZufI2ySru5C5Lb5tev
X-Proofpoint-GUID: gSWtDhsTKst9_FZufI2ySru5C5Lb5tev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX6ba/Pqbal3cC
 fgCC/TlMNTbBR7nDHicQnHHtpEo5miqxYJ0qy99DfNNygRzT4t9XuzHFP4WgvJiTIVQed9X8EWT
 WeEv2UCE4bTqjSTxtyzB5heHeth0BvPI4DIye4oEIWjBld6rkhiTkQ0DBis8BsV56ZWfFjs0hqf
 Fq6GccnecVLrOvpRhik7NnjuUofQ4XdsmjNeGLHevKFlhP3+3uUM7v9dEvFfWE+beLPdP8Vsh8b
 cR9kWO2jVgrsARAKnFYtyhR6J1WJ6lUkhqSefoA8bsWM2mfttwLuJlG/ONwjAmtm0AXuZVERYob
 D92ZcPr8IYYNWpQnCYXxu/OIkqToimmPfNZ5um2C5aVMp3hF2l/2ad93ejFF8y0vLzDuhBWx8oU
 P+CzgAHawpPESnnE2Y6dNTeAg+F4acVko7JJDgRrIi2rFyxcT9bx4hQgykgi5TNq+Wb6OMG68kf
 bIqQPOkx8fahZJHKLSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072931_297994_FC7F04CA 
X-CRM114-Status: UNSURE (   9.84  )
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


On Tue, 13 Jan 2026 13:46:36 +0800, Yingying Tang wrote:
> Wrong P2P device link id value of 0 was introduced in ath12k_mac_op_tx() by [1].
> 
> During the P2P negotiation process, there is only one scan vdev with link ID 15.
> Currently, the device link ID is incorrectly set to 0 in ath12k_mac_op_tx()
> during the P2P negotiation process, which leads to TX failures.
> 
> Set the correct P2P device link ID to 15 to fix the TX failure issue.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix wrong P2P device link id issue
      commit: 31707572108da55a005e7fed32cc3869c16b7c16

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


