Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DD4606A320
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BJo02sPz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LlwgX1B9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hsKwqa12
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHps6C48bjErWLWTA2jyVj+V/HCuKfjWf7ze/6BLmro=; b=BJo02sPzyGGDpIZsb0fRzatnc4
	qaA2nXYXjOcsKch2Ub0dsoWNQNgfr/tnQxU24TtrVMT9L65uxDKvh4m6Y7/RWaEEI+8xD9zFBAiAs
	P89fgw/wsh6G7EuNDnbaOMGBDR2q5WLN7HBFFIF8WTOKCZ84rgZo5JxGRxLN9hMa/j+dpdES0z0DT
	ayf9cOZ3PLidIdPN7iUlOOlE2f7qlN8PmMN0EKC/1HHaSaFgyWbRAVIgWySDENcm8Z/dU2mk8at4G
	RKl49SR6Vqz+lh9/vj6FcLma7+OSvOrS0f+ZrFz9OBYXrZXzWK4K0rlo0ShBEp6+r781a6KDg9l2L
	X9sO467Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW2v-0000000BrgQ-0BSv;
	Wed, 21 Oct 2026 13:07:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW2s-0000000Brfl-0Dvn
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 13:07:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LCf291618759
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 13:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uHps6C48bjErWLWTA2jyVj+V
	/HCuKfjWf7ze/6BLmro=; b=LlwgX1B9QPTmQmXJZC3FEVbGiGYzEgnKeg2Kv2j2
	x73Z6bydNkiDaDZz7Rkt36TgSMxA0Tcon7A/Qkx9jgOD1Gr1bX7uiFUeqxlYvU6m
	OBRVwUscuRRKuGqCYTHFdWJ6YCGGMfYt2upE8FItNlJmVASCW61RC9znVFkT611h
	tqRBVbVLIFrFdZgtmkD0Zrpc15+/D0sDRrbJ517N8TSD0K8NaN0Wn7VtvRpn7Q3f
	sgmJ2BUqwy1GDryKVySzuOW+wr9/z4nWf8gLxYeHV9EiBoR/oOkdP8pvQHlcJ7xT
	YSeiW3AYBYrq/mrwwj7o8LrXnjMRdplYPaRd1j9irawV2Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r33nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 13:07:52 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1583363c88.0
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 06:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792588071; x=1793192871; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uHps6C48bjErWLWTA2jyVj+V/HCuKfjWf7ze/6BLmro=;
        b=hsKwqa12+7a5vJlYf4Ls3DNDszJre38wJNw6sQQLuIQY4XHC8W0tNSdVuKGWpBsIf9
         ARijQJzQ7OPkytU7278bUX2cdLCAa0TpsMZh1UX8y6HiHinSy0DYmBRfI6mNXsVRSMYY
         y8zLPAFGb/6O7ylJSWoYPjAmI+22DAIfAoQVxzrM+x1sJ/D7/xE+nUgafPI8MENv7gUa
         o9Hdr9Q6qTFjJcEpAGRpUHf/ajRmVOUSwPuV7WfXLxOyXexkaoQ/omyjySbBZ+PpOsHF
         oFBRyBzFrqTSLNWNjqPDZ48F9SADe/pM2pFzjedhRx9gXQ7+v9Ko1bQL6eA3Pz6u6i1a
         of1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588071; x=1793192871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHps6C48bjErWLWTA2jyVj+V/HCuKfjWf7ze/6BLmro=;
        b=ioutlGPlPNQ1gw237NacZIyzVB4OLrjLHQYz4Oc8LcjhM7g2EXlO88BeppBfPSnu3k
         T5abPZbPyS6+kvaOlkBnbpUuB+Tapslx1ZoToFr+NbCUjFADAVJ+OlmgDanpq9Lnodc9
         kri06lzX7lE7chiaxYFKvedLvlrPuL2bBi5AJYR7mPCqC6kB/b4gvV+XvPKwg+UHvET9
         RTEkVlwFyzGUern/IV1r9j/p2rbEGcizbcx6xEyQOtvIe77zk82qWDCOjKcfmWQqdkHb
         v3WVO7sg4gxbxnSDL0K8HKDnymyWBGGIzVnqtTZKvAscolejtRmcnqy8QsmTN4QtTq2x
         06sg==
X-Forwarded-Encrypted: i=1; AKwUvBzv+hReqjFCe56j5gaffUg0bL9z+5yhNnqmJrjwMD2BRkBrJo/HIUQg/Ymy8wr4tNnpktwDMes=@lists.infradead.org
X-Gm-Message-State: AFq9FYJHl9SzyEpkDaMoiT9HJc8FNS5hsey2QYHnM42AIs6M/gwRn8L/
	yCCgROi1w3EGw+2k2ZjONqhMjy7os3RlsU6mDj8LDhyoQ4uMLh34KeH2z4TgmTuNdr441al6Xj6
	Mkt8fTFBlTQZF6jEKLo4QKSQIu27HWHlr97XWyL0jBfsyW0+wZMHvAeiYeKMk2mKj
X-Gm-Gg: AYBFou1y0uKBw92fVH1mwguGR5JbPv7JZkhmGYSb0YG1jkMmUfxsF+kXOw9FUS0Bgnu
	BXZjgKzyn9ydQkogm//HS4FOI2z0XjIEXgcNPkeXc7vDO3t42EVXAdef+CdcTPpeI4+1aLiGK1w
	H4lRV76g0Bn8omzmWujr+qQJeR4IqpLSy+ACsBLeiGPKTqmvdaQ9pE5VCoPl647jv1x5phzMKsI
	Aava8/ZhOvVgBg++q3FN3ifsXZurqEhBXZqeLiY1xXjG7aHaDd6VPOavSwLmmAX8Mb49j4NVIZg
	R/wFla8WrsXTpr5liMtUHFjXn52+xkR3boWWoY41pM5pZ28+RtoeSUCGIa+b/Cbtl2KXHM+iAmA
	rkmRIAWtXkzoHhnuWL/hpySwf/A==
X-Received: by 2002:a05:7022:7e04:b0:15c:705f:b981 with SMTP id a92af1059eb24-190a67fb474mr2783398c88.32.1792588070841;
        Wed, 21 Oct 2026 06:07:50 -0700 (PDT)
X-Received: by 2002:a05:7022:7e04:b0:15c:705f:b981 with SMTP id a92af1059eb24-190a67fb474mr2783235c88.32.1792588069115;
        Wed, 21 Oct 2026 06:07:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm6052461c88.14.2026.10.21.06.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:07:48 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:37:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and
 qcom_pas_prepare_and_auth_reset()
Message-ID: <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8b928 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wXrbNP8IbqZU6GI7zsQA:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: oCScQQ2SX0DBuAu7Oy-OY1-4MTFPRMMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX5TOGQAKm8qUc
 ZHK7JgPKMBaSBTpsfDF/WZbrQONEyn4DozoI6JPhJ0JiK4raOeGYQrjIwuPfXaUK9Xwhz151Wtq
 leZno/tNh5ppLXbQpZQ5mhrMqjREqSM+/XuSVBLywvnK9J9kKxTJSObkIlPvf5jHFkUmzSCcWsE
 WgR9uCs4spFe1HJcaaSpVFZNIoP8jGTZRHYxNuLl/wXj4W58LkKOEhEvTxPzVALym+AGPpxJxqv
 hKROuIf6Q69pg+Cia4nN6Ze4DWWiuKnwiQe0eOiHWU+dMTKiVKaIXwceLBJBSUqJBEAx5znbQSj
 nqKIL4m/4xm9fEVE+OQtxBKZXhsK4DQdFlOKOHZHnd+0EKHaTfqGWsA2cX9cqxjSPVegKv496kL
 3Tavo2+/w9p7YF5aqSVldFv1VlIfdp8iny5bjtDTG8jJdAWehJpuMNOuCSdQpLs4DUKMEEhRWnn
 O2+F7A9vUeb9BAiGLug==
X-Proofpoint-GUID: oCScQQ2SX0DBuAu7Oy-OY1-4MTFPRMMc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX7QreS9vmNTuH
 QdMjx3CZzuayVdfVorzXxLXmZum6MKwuUALoiDecRxWt4BEtCc4MjEGbhYKNinni5gHClBPiDXo
 AgmqISykNO3oGaftmNNlLPpJAgn07FI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_060754_209863_E68F78D6 
X-CRM114-Status: GOOD (  20.40  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 01:32:13PM +0200, Konrad Dybcio wrote:
> On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> > In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> > public function, migrate every user to the new PAS context-aware API
> > qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> > 
> > This series migrates every remaining caller of the deprecated APIs
> > (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> > removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> > 
> > This series is based on top of although no dependency as such.
> >   firmware: qcom: pas: Make MDT buffer retention explicit
> 
> LLM has the following comments:
> 
>  1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
> reload, because qcom_pas_metadata_release() is never called
> (patches 1-6)
>  2. devm_qcom_pas_context_alloc() is called from repeatable runtime
> paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
>  3. use_tzmem is never set, so the shmbridge prepare step never
> runs on SCM and the commit messages are inaccurate; TEE gets
> a real mem_phys/mem_size change
>  4. Not bisectable: patch 4 relies on the NULL mem_region
> handling that only arrives in patch 7
>  5. Patches 3 and 4 don't apply to this tree; iris
> iris_detect_firmware() still needs mem_virt after the load;
> the base of the series is not stated
>  6. Patch 7: NULL mem_region now means "map internally", which
> weakens the -EINVAL sanity check
>  7. Patch 6: redundant second ioremap_wc() on top of ath12k's
> persistent memremap()
>  8. Patch 6: ctx is set under one scm_auth_enabled check and
> used under another, which is fragile
>  9. Patch 2: the context now carries the full region size instead of
> the MDT size, which matters if use_tzmem gets enabled
> 10. Patch 3: stale qcom_mdt_load() comments remain in
> iris_firmware.c
> 11. Patch 8: no issues found

Thanks.  Will address them along with Sasiko's one.

-- 
-Mukesh Ojha

