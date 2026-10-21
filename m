Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F47606A31A
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZTGaeUX;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8RcDq9l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCe8ByDE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=; b=MZTGaeUXCf51kON83Frg/ZhayG
	DFOVqMimRtv+HQGBH1RZPpTPrvYfHXm0890DT3hfDpK3q4KmWXoqT0FBg2uzlDnubFuG2xUnApE8P
	y7TYjCIOe0/YnIyes5MSCFXWQ3lYkWpNmaRjYJsZ1zF3Fh+eoF8yT35vVhQli6N2R/+k9nfDI8G64
	YFq08ErjSDQrKXeRZUKfWzE7x8pWy6liRdxpd1vXMrl6/usQZmFVSgUrzPxKunUXGWg3jWgLrw9Q3
	eBlx6hzIfjen/mbslRY6sc0/EigzKEnQyNWLcF8ibLg2awC2v5hP/BvDZWBezfN8SGOxeWf7cyXZK
	BMfIu5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUYR-0000000Bj8L-3oJK;
	Wed, 21 Oct 2026 11:32:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUYP-0000000Bj7o-2uIL
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 11:32:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBG0o4433672
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 11:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=; b=l8RcDq9l3hlmBKdH
	rHQYwc1NxJzwU37rKeIVvtCVpG8tsm7/8m+fWL+7YJUxZ6Vz3+cd8wWCQAS9o3c5
	UdJdmH9FKwP5kfwIwPl+6MWhFnTlVJPaPtLBL7lNfsIAWyL75d8BjyW6+oSjkyUJ
	ts9zKlfWRcQohLZIuyF4Kv2BswJmjxVnnHcFvKZONBDwYAAPXPzEQlklVjDT1vn6
	Pb+hBCG0A9MkIXgbz/Mn7vUDpELVFnNAi4axkd37MCHC/jFgEMY8ILSzysAg/KqK
	Fd+dyBGog6MJCbZC6DMF7dy2OC4ssqVHtW3J9pskxoTBWqBA/VRpeZn2rAqlwH9F
	yNqkLA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2s4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 11:32:20 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0e2566d30so12328137.3
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582340; x=1793187140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=;
        b=FCe8ByDEjF4xrllK6CHEp8F41ZqYONKjL5JqZDGEvt6KtRG5WnmaQA9Kkxb0cJJMBV
         lBgonrHqbAcmV5fEYJ4n1q+syT8daTKsCzUsw9y5lpT3qYD9x0bA2u7gcaYqerZVCatk
         cSzyR4YLcjDcpFqjKARoL/wYydSY/qh53Ce1hsiDzmyXwYeeZDeyph777fLABGNFSClW
         xvSbIidCaMIuV1MuQ6dpdMEWKPQ6htRitxTw+PitVPzmG4KhiBbwHQ6lpAspFZ/AuNsd
         TV5z+K6BwqUK0RJq9bvC2nZYhf6rqbGBC4E2fKEPBY3gWMqT3qk8nenTAFjq9eck2e3c
         qFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582340; x=1793187140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bn9+rLi7mMU4unxZrBwSU21TRh2XBO4KfFG2d5PF1A=;
        b=T1y9QypRIWTNt7kHxVjnl2DOp6c88aHMms8V53wB2w7cLhVANrmpC3gZTI9QIxZmb0
         Y8a9daFjC1cIdZV7RDMTxtQMiGdE27GhHnYgZGhuwPIt32uceLUU41fo+pS1JV2JZzxv
         KICs1cyHKYQHSe55R4H9GDIkxey2rSPRzPwklCjN9F/MzAEWabYTQRoWwIuD6T8cgOxx
         dS6uCAtI6/GPDLSNwDVCIW29uKWPIaZjkM5GzxDOCbRjTHSBDHWR/ZiL6+qTuimz2s4v
         jW3LPYYlNzveObnPfQvzOGpMdCCHIGAhIMwqLR/HVuzv/KG/J1a+Z1rYQi2ckREysyDg
         2NkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFAH8w2S/QXEvO4Vuy1nVAipE/D3xCHeBFkux1MXXjfvx9dTujhtjlKjNzNEk59QuKCETrzYk=@lists.infradead.org
X-Gm-Message-State: AFq9FYK0HBcFjWhHzGQtqeeGzcIm4qGhNFBS8OPCKf0e35ouZ7vjfjUq
	WEW16GxKgG+VWYCOagZaHFnBD2VyPQDi08nw2olah3pmqBbr6CkanohSzxnMzu1+XxE1nrHZT8p
	ziQh/q/XqsRGEEgefLlx6eQV1IrFKFOm8tPFzRKVa06yqexI584WpEsrUuggy3dFm
X-Gm-Gg: AYBFou1sRH15Usu8RfH9Zu64w4YRGSKWU33jmKEUN7lPjEUzbrXEwoKSeBi2I23eUkB
	+xy5wZdnmCfbFN0WHZvPdblcZpwQBG/+nbYxnT3lin7UM5l8de18ianvCZpgGXQkLPT0uwwZg1g
	NTbBaoOSfDoFKvvmCF0440wmYOvZuT+6kYx6xfx18GVcRG3hoUuiRlwr0jhunQFS8ucKSa8HmbB
	7CWKNRGJcrfVFOOMUGZq0GKtBo9svWbPzPFqyPE73qYeFy5nnaYgZy3mb4RhN5jGW9pvafVT1XD
	8gVBG7y0xZ38YIctWXKglcMLN4DKFy6v52p5bEfoj9WNwU/JnuJ7YP3Ob4yPNBTOyYya6YYRe7v
	VLrkpuEODpfVft9Xmz65U6Q==
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr467063137.3.1792582339584;
        Wed, 21 Oct 2026 04:32:19 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr467038137.3.1792582339070;
        Wed, 21 Oct 2026 04:32:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fafd25sm67887866b.47.2026.10.21.04.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:32:18 -0700 (PDT)
Message-ID: <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:32:13 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and
 qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8a2c4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=25W5T12MUkcB5wj6RmwA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 9gnE81WHYtmORNsvY_ki-WK24jkWMODU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfXxmS9rzO9O+2p
 0Xni5UeK6Xr/3pI04NNyaSawIOoF6S/832NVXEnN0Ms1rigZZfqMDLGgttcptG7eE0h3YsrcYGu
 hFWKsmDC2IiL6pzgElRcF7gZe097Psyh5zHEI0jbc5IOemy3gNmm4Sb6S4FvDJL8trueNQX08Ff
 fjs4fP4V/QNKXNRhhGdwy5VgPGCJIVj34s5n6phWroeRjPcgGfyV6RlfTkRLgNPu75EASdrlokC
 wM+vVi7hQXIcnB0BCnA1g8s+36yb5EZc5Zv9L2KF6RJDgPI9V44Rx23o174IkCw8Ef19mn7672l
 DJWBM6i7x+I5Im9xekQWOuZv1BQDG7XMOYYLFQ3SQvT7E4w84LKDm5pmas87Ysp0F7/dd9kN0M+
 t3mC7hSh/7Bz3t2SYw7JZpZU7pFVtZyypGXiJhZR7uDVNvfTVwsQPyXBhfANhIpaDUSu0CZeZiy
 GwqSNhN41IEWeGDLWGg==
X-Proofpoint-GUID: 9gnE81WHYtmORNsvY_ki-WK24jkWMODU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX9rienYWR8QQ1
 d/cPI7/FxxtPx9vxM/xsOBH2vdYkGrQkg2mQbFd156eepxzQbBQ4cn4tzJEKov3tHeANxf2TyyZ
 SdFf9PyYRvu0Hy0F0V5Yhi8bAUB8Ucg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_043221_853581_9D920142 
X-CRM114-Status: GOOD (  12.15  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> public function, migrate every user to the new PAS context-aware API
> qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> 
> This series migrates every remaining caller of the deprecated APIs
> (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> 
> This series is based on top of although no dependency as such.
>   firmware: qcom: pas: Make MDT buffer retention explicit

LLM has the following comments:

 1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
reload, because qcom_pas_metadata_release() is never called
(patches 1-6)
 2. devm_qcom_pas_context_alloc() is called from repeatable runtime
paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
 3. use_tzmem is never set, so the shmbridge prepare step never
runs on SCM and the commit messages are inaccurate; TEE gets
a real mem_phys/mem_size change
 4. Not bisectable: patch 4 relies on the NULL mem_region
handling that only arrives in patch 7
 5. Patches 3 and 4 don't apply to this tree; iris
iris_detect_firmware() still needs mem_virt after the load;
the base of the series is not stated
 6. Patch 7: NULL mem_region now means "map internally", which
weakens the -EINVAL sanity check
 7. Patch 6: redundant second ioremap_wc() on top of ath12k's
persistent memremap()
 8. Patch 6: ctx is set under one scm_auth_enabled check and
used under another, which is fragile
 9. Patch 2: the context now carries the full region size instead of
the MDT size, which matters if use_tzmem gets enabled
10. Patch 3: stale qcom_mdt_load() comments remain in
iris_firmware.c
11. Patch 8: no issues found

Konrad

