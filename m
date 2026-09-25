Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612EAC98321
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXVQc6aLJixe5RrAOxuDkgZnGe2vAyUG+yHDdq/ggLE=; b=Z0cxhVGB/vvjiP4Ujfqssf/fpt
	jWL/159pGPIDv6XmEwHCO6y79t2fRuAtHqtAdrdCOkgncJv9+gFKuvk7Mm3bEQFPSHitBrn+jFQGy
	FRbiRnJfjh5O5VQb+X/NNXRo8rX9VUEFHrC6OxZmi5kQujH7DZQelBDT6MiComGj34QBIy4kMFZas
	JKEJ6cB4yDRCYrmjc6WY9/0KdTWKt4P+mHkj0IFQvwRWR/3TRB+MYUsB8Eyo4RNa0JKk5NeV+Fk9R
	un0rcb5A31wAS5TEkLnYawziOPpBhyHESl9NGTfkfIoaZ2dfjSBHF4H+tRT1LVAFNY3imeqRP5u6n
	gKWyba9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pH-0000000Dmco-0Q1I;
	Fri, 25 Sep 2026 15:27:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pF-0000000DmcE-0rJg
	for ath12k@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rXVQc6aLJixe5RrAOxuDkgZnGe2vAyUG+yHDdq/ggLE=; b=W0tAWbCvbIgmuFkg0aOwRiLxgO
	rD8XkDe7yAyCzF2xIAdYzYLVbYDr+YJH+YCeRzmXLURIhJNf4MUjeXyjVs4hWkMlDo1XqAVHSqtfM
	sLJ9E1Nu3wJ+MwmefpF/Ijjw0rTm6Ay9JgtozxjFPPmEc9yf/a/aDNc1lo/AbpBLxsD0j9Cd2/OMd
	koeINn3idLBlV/mL0+rLp3lrBG5k+FEEKt96OO3BKp1m1L/Lc+80UyajRe5WDF1StMIdzokdBI+QZ
	d7XVYhXyuSLeik9gFgAoXfIpApN0rIl3jhV68COKA9r0QIIbJzpcXMakl1ErxeaBfrPh4G98gVXFw
	SmaFqCqQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA7pC-0000000H3iY-1Pg7
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:27:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLwdw900726
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXVQc6aLJixe5RrAOxuDkgZnGe2vAyUG+yHDdq/ggLE=; b=fqIxs2cOyz0GMOwB
	0etcScGPyuq77tfsZ9qPkhOZahYV09dotaapRQ638IIkdCVionNUc6zpQtEuBIdW
	92T/nUpbSp0QyZZIddenTkzyC/IbGaEBsGRSwj62xDBhVIJKEF9oGn0EPoheBUc6
	S0R9xMYasjwoT7897zcuC93SWp+LKb/lN+RxFLsXL59L8geDKhbe6oIDBU9C2BuT
	G051klYVVj1nhgTwxG8yEVlZiJCocIIXzTxYACeQ0dW2Dm65uMDPD6aVFwopAJM7
	uK6AIMlpAyecJ0K6akg8hSPZ8C7QNUNK5WnBRebUT8vZusvP6HzSt8j9Qp2w4MoD
	5C6loQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100snv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:26:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1587899a91.3
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350013; x=1790954813; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXVQc6aLJixe5RrAOxuDkgZnGe2vAyUG+yHDdq/ggLE=;
        b=aEXebpPSGJx2EblGtoltc1rpSGsF2VmLLr/SCs0yKcnuA/dzXVDMCUAE8N0rGD3huy
         riDKQgLmDwdJ8qvZT60FboT/2q/Y+mTkJqIFcrHFXSmGbpyDcn7sGHS9PSCgZpePk7lo
         d+Vb0WGW37V1NTFm/BVUB1J6mQ4JLAXKJ0xy/gzKZcyJf4f3za/+CJ77YP+hdtUMIbHK
         vK8g4jalc1am52SdI+1EG7M0OXhdFouw7ElczwzJqYmMUV4KVDbS8MAMOI1JX5O09hyj
         gbMEx5K1C2BsXlcJH4xXkpUuCMhgTi0F3ePRkWbkmJRf0iDW8RXZLOFP+rzZ1DedGJfl
         S6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350013; x=1790954813;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXVQc6aLJixe5RrAOxuDkgZnGe2vAyUG+yHDdq/ggLE=;
        b=Oj6ofWei+92PuHadHw1ehynGM3zBDmW6QPeW7lHE/wDXAldW6oLT89PFzu7ZKrYR0x
         Ga2VL8+m6ifcgVldlEZVCtk0y9iZpyqleo7ZpdgdGbzB7TJunE+ZBkdpu5YFn2GVYOIw
         X5HGxUsqra8MRrJctadrmHDWbXHihlwOkBqpZoKHkGvFLAfFm1q9FDxzVuJi8/Mjvzg/
         LLW+wGCseiWBUBmrdIcRR2h/cItP4NLRXx3WKsdxAvOhBoeVUfbKIwuAtH75sEFvoCeo
         BoHqHxK2SGpcIGIaTlrqHeoSXYL4lm9ZnGqcWXKJa8uz0WvwouyVGrql/iBtXua2/7Gq
         6W8w==
X-Gm-Message-State: AFuF++kd8/4V4XNoiaPRCdergzn6Lpq2nv7LpFIXJoWBTMRLG0rTnH4t
	ru48ZeDQWBq362rFCyyvcsQu7eNGLDKohXwKnuXBS8HZeKjiVlrhrrYvFGXVPuA6e4/OUWrsDC6
	oNU+t65qrFtSEpPXCSn4Xev2js+H5NT9J/A7JYY1WH7q57PD74zU4MhU3kPvYfSiq
X-Gm-Gg: AYBFou1e4mIOg+dFM9nutkKPAzUhoyezlpYJwSUwc2zGUqkZY24s/Pj5FyxwxyKtN8p
	XSw8+w8VuI3Up9RmvY/2Kv2QpuRffw9Bdyw57b7xFP9XhnmIcDjvaotsTgWBQ9KoOKLVpXtvF4C
	qwoBUtsEedB1cqXxJ22HuiXUVsRTy3TTD90NOgpag42y/qVxaTAdK5ilMDHcEfqA3UYCR3EgxOa
	ycIVL51wwGLbh55S9L03vHXiWSiC3kT/oYM3/Q/mpIy6sknXmrS5JJdE0DnMKeOceRfgqFDGTwb
	nNNVYPLLOIBs0N/CpWXQ1M0lRIQDWb4CnHMPgxYd6EL905RTK6Ff0EX2IYFlySzWMITqjsWkLwp
	3V9ZV4Ppfc6WIRCRWoxvR34TUUYyUP4FX+4DDVcytpVlw+Ahe0HXJ7KU=
X-Received: by 2002:a17:90b:2251:b0:3a0:9640:8031 with SMTP id 98e67ed59e1d1-3a098d4364cmr4939325a91.8.1790350013304;
        Fri, 25 Sep 2026 08:26:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2251:b0:3a0:9640:8031 with SMTP id 98e67ed59e1d1-3a098d4364cmr4939304a91.8.1790350012765;
        Fri, 25 Sep 2026 08:26:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm5320405a91.0.2026.09.25.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/7] wifi: ath12k: convert DP profile
 parameter macros to inline helpers
Message-Id: <179035001156.3875741.885181265927010511.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:26:51 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX4BD116oUSQAJ
 RuLlXxGk/Suazfr3HEcGw20cvTRcnUu75kyMA+bua5AjCy0VdjSiFAcNw/QYckLKQMo4EN6WNuX
 8M8sJF9UX3tdplnVcSKF18tyTHyWdE010hOR8lH6I7cDA4OM12sNAIFQxiJ3Rwh662HK22CmEkm
 Y6EojmtidXxvbRwXxROwTlmxDQX+WjzOoA+BNje5iIAEeTJbEZXY6RJFGVkcXjj4FBqI2Zzvuhp
 vXyVEZaYkp5KNZfHtIW9GGQyGZRSaWNsexGWZqKIRUMBG6MA1lBIR0ykjijGXjak3TBTWfZaxyY
 uJ3OSqQy+6/ZVVrYgzRxuDcaVeY1Hlx5WnWdyFTD13qNwWSIUJEfYUo/QcqYbxoaygkobVlhNcR
 XIC7hu9LDoBVLq1MMAvYO6puEmAKQRBYshj9HEelb06RedcfUZupZKbbxmrgkOrJdbxReMUKoA+
 J6SL0syUP8glg69CrJw==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab692be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ch_5UUNQQzOSiarRQcwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: hYltIzWd_vjR7FoF5UGldxRGOrNkKM-S
X-Proofpoint-GUID: hYltIzWd_vjR7FoF5UGldxRGOrNkKM-S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX7wVA2COekgCF
 dnedkistqSOzSBnRuVb4s6qyl68HItGQ5t613bVOaKsz3FMMRu4VsILHe+JbMTQbumABnjJqqCi
 5y7/gCtlvMMdiGCgj0Fn7RnEHPmuKaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_162658_683714_D89305EF 
X-CRM114-Status: UNSURE (   7.38  )
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


On Thu, 20 Aug 2026 11:17:57 +0530, Aaradhana Sahu wrote:
> Convert the Data Path (DP) profile parameter macros to static inline helper
> function without changing any functional behavior.
> 
> Aaradhana Sahu (7):
>   wifi: ath12k: move dp_profile_params to dp.h
>   wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
>   wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
>   wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
>   wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
>   wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
>   wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
> 
> [...]

Applied, thanks!

[1/7] wifi: ath12k: move dp_profile_params to dp.h
      commit: bf7c19e231e2f48cafddbe3f4c2a2f5b6184b55f
[2/7] wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
      commit: eaff19e86c2dbde320ccc8812cafb0a366dc65f4
[3/7] wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
      commit: d57f90669269fad2dd9ca98cd32b7412ceccb0b0
[4/7] wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
      commit: 62e2758d17d307753457bd51af074be5f8265c03
[5/7] wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
      commit: 99b85a24189a518938eb0f1c4f8e15fbab4373ec
[6/7] wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
      commit: fafb9b0450fd6fd3618daf347717a6d6320bea38
[7/7] wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
      commit: 897d2e0046f941d8956f655f5ffc5d75c788558d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


