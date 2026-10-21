Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF26606A323
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CwSEW5+i;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EIv8tbx6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RvE86Rkt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=; b=CwSEW5+ibsS4Iu0zAGMn+sPAUe
	usN+ECoLe0F27YqeJ/WaK3ep6zUHkf2QPwN0bGxkTQMSc/gVqT3l0ugHE3kM+XSQpBSDVpLrdgcu9
	Yz+Tf8d6QhWivLizpJdLOQ2yLjbOM/a0DED/Uwt6sQ5Aax8LYJ0x0/pLWXPILipyuv/3GqFIPjJcZ
	K4AqmHhGrZy2zwxHFpZCVs1NcpRrZ1EujUSpnwAd54B/t5uiT3O1rukr+Dd1qh/ktQxf3gyyikQna
	Bf9Mt5cCOTcn8adaF+q/8c0fE1TSnSSGUzJpiJNZ9lBhfNOQOCDkLXxVq/tjM50zwbVVStCfYlnry
	GwkP6pZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWEj-0000000BtBp-0WGy;
	Wed, 21 Oct 2026 13:20:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWEg-0000000BtBN-0eJj
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 13:20:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfugD543790
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 13:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aSnzuw64QaL2ODuF7dIoTHdi
	PuBaqdsaTTJECpYAR54=; b=EIv8tbx6tXPAcGXLwoHMp83UmNhsZWHR/l9I8HDi
	4/NrazfTe4cn1dw9qZPNikqZsw4VVrGPrY4VtSEFy9B6EJYk1yQ+z1v03RCikitv
	K2YIJ0XBiKWbLJwtOzXCYY+SYkCcsRUwgYQ8nuVJdN1UTbWR3t6Lsyk4iRLagU9X
	iwGJ0sXwcyFwUH+4ANIereXBcz7d8bV63FMhwxx9w5IKcrZbrbm0x8MD1BoQOd1M
	Wv/u6WWzBsPnrYV5W0cH9JesZmgnCCTV8T3s+GVT+4io2QwEiMSn4FEkY+DU2lS4
	e2QI7TEEg5n0OPk7FoWS5Dm/se8LLP2qSKvoCQXVATJTVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48vvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 13:20:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so238201785a.3
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792588804; x=1793193604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=;
        b=RvE86RktukmybN0PT0yILN/uhf4FJDdtx8Atoc6q3eaOeZfBZ+MBlGoqUZ7IfeLjk0
         fANIPXyY2ash2jZnu7yrJQ9ZZF87dsaRe19RaCxtUvtCqg5IxIUe1psKhbCoslDHKSio
         vVxvjQ3gU+DifQKKaYIOuL2Wz1wXHDja3PaQmIUruooRY8MUiAKvITj5Mxrav+yuYuVZ
         4An1B/kXnwzyHCch9HeSA0/0WEHrXLv29ot9IsprXEqJ27oK+3BFpz+mF7D6j3ZuYKfp
         OS3YUgL8jP8ZnIzrJxBVcDiVLH4ZItnCXupckqhikb/pLfxVoxkgvMHWnkvyReCQ9Nv2
         CRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588804; x=1793193604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=;
        b=Srh3ha5i8M9W7eiX8+g3LjSBdKEpP4auY8Ev2Ag3qVRG8gIOtPCAbvbHFCLsDNCzWg
         mCfwZwpzx2EnxOhWpkrZz6LUBzsX9lq/EVzkyozcrHFyr7RFA2usXIWYm81MmUOvIgcj
         J4NCSeIYf4WEeBJ1XUcld618KSaSVlPlEIBOeMLILPd5WhGF79P/p7ttC6XRrGZD3K8q
         7y65h8du8JTKaWhEw/pj/aX6jX3CQik9VacbAq5g8InyW0quRFCEaN+OE49YTqLKE1bA
         bwYWZ3A0YNg44hatgWD1AtDq332wwJ2x7SxZTJhpV3AG2VhWXeFptKEnbhg6aEnabRSe
         KEgA==
X-Forwarded-Encrypted: i=1; AKwUvBwTgRWHnxrW6qC8/pPSajNcyOuEh4JkIueg2fmzxEY6HwWPBJLNZZnonjd6hI57ibChxBIMpaE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKjRVrIWMTqeTA4mVUdL8KlXrfzGg8RkNIFR32ZQZrv+IwOA17i
	dGeouJ/y15mfnUe/4wHdaKDS8iO3xcIWnPyyytlUVTzf4pIpLil7Ee8N+q930zxowYb2N1I4yvo
	9U85c1vUQzaNOwdsXK7QhAGHO8eKR/m45Q2Va1vR2dIT1KfgdaHX20j+A3xNzFEAv
X-Gm-Gg: AYBFou2YQOohVK9OcgI0G+DxQvJLDk/aHh7mswR4ViU8FzDls7Yl+A0qSNhTfGreDrM
	Kg0x/aiu0ydw/gpjF6Bu852pWEQ91VDLoKu3gI6oAqxYXyZoqpdi/b5vTVqCT6vaaFkTVQ7tDAX
	cSU2Xfxrl0OeaTDqvN29l2GUfFeNXXz2gHhCb3XkSKV8ZKKQnlJPH8XtFLt/AcNknByDKMmWsil
	Byrwbbgv4NJJR/pfq/vvZHliuAkMwEO/0lESfRFPvgTYmrKWpLcV4L71ADZq4vm4XoLI66SMhJW
	cS1NBU5Dm27QKtbqL9BdnWeRLaUiRHfTMWfQpm8WRg1b9XhtQqRzl+7NcYNfDEE38yk6uG7W4uw
	CTCuQVPnHWWXlxEbbYp2vq5nR/gLR+68sAVXH6guMc+p00Ejf2LVYhTY+kfVv+MArzfgE/5Sr4W
	d/RZzTK9PeSbqC
X-Received: by 2002:a05:620a:40d2:b0:93f:571b:c72c with SMTP id af79cd13be357-93f57f66116mr409626385a.46.1792588803912;
        Wed, 21 Oct 2026 06:20:03 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93f:571b:c72c with SMTP id af79cd13be357-93f57f66116mr409621585a.46.1792588803368;
        Wed, 21 Oct 2026 06:20:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1224fafsm512832e87.63.2026.10.21.06.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:20:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 16:19:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
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
Message-ID: <zqu4sweaftstbt26v2u3ajzv7snnqswuyrktm7t7k5gh4zi77e@d6t2fpsinvxc>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
 <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7RNlz7NSCLWBj2YLtX93r0b5-WSh6mtW
X-Proofpoint-GUID: 7RNlz7NSCLWBj2YLtX93r0b5-WSh6mtW
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8bc05 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=LTSqVt2n0stEVfQD8AYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX4o6wG/UdMpVn
 7jTV/zD7hQE7U8Cz3YKkLV8Y71Y/6t1SnThjy9fteLricp4Pz/dFbjPLjN6ANGHjsChk5PyhpRD
 nz0EvRnXkI0pRaHJ5vBluUfxK7AXsbqqVdnMRgFHftmwTsZX6x2GU/tVG73jMYNWJ6Z3jiNY2jw
 /8Ea3tbJnA8D+691YUHXOUvM6/E/hGdqKbXwo339XQLfSfiVLkecDmfTht5ZZf8ePc2du0IjMfU
 eXiZgBwpFDJxnB9sfHdrnc5cC6f8iDWXiSqPrHo2vSuix1eEdaIqLPM+4fQk1IYy0m91X7GDQW6
 wgr16nc8w66XQAl/3Egzqdlr2nm/y9TBC/mW6FDXyqoJeGOrOHORUZYdhdT5L9AW5pu4GBq3SD4
 uosHex9deeBZ/N8MT5RXXustqosUpZ/Z7DUNINDVfTQSFZ+Rx9iV6MxHH6QcXiN1Ba65+5rtoXt
 gTC0oUsdiFs/pcY45bQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX1vYRgo5mcbvw
 D8iSvfyrJa6x7CZ8r9//vZKSjDU6xcIBAccMroSV1WBLcUD+mkEO77XccuA65P47YgPPhX09iTZ
 kJhRfVHOUfqKGask0ltQenYwCFdcGc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_062006_228530_72A0FB54 
X-CRM114-Status: GOOD (  23.59  )
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

On Wed, Oct 21, 2026 at 06:37:35PM +0530, Mukesh Ojha wrote:
> On Wed, Oct 21, 2026 at 01:32:13PM +0200, Konrad Dybcio wrote:
> > On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> > > In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> > > public function, migrate every user to the new PAS context-aware API
> > > qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> > > 
> > > This series migrates every remaining caller of the deprecated APIs
> > > (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> > > removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> > > 
> > > This series is based on top of although no dependency as such.
> > >   firmware: qcom: pas: Make MDT buffer retention explicit
> > 
> > LLM has the following comments:
> > 
> >  1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
> > reload, because qcom_pas_metadata_release() is never called
> > (patches 1-6)
> >  2. devm_qcom_pas_context_alloc() is called from repeatable runtime
> > paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
> >  3. use_tzmem is never set, so the shmbridge prepare step never
> > runs on SCM and the commit messages are inaccurate; TEE gets
> > a real mem_phys/mem_size change
> >  4. Not bisectable: patch 4 relies on the NULL mem_region
> > handling that only arrives in patch 7
> >  5. Patches 3 and 4 don't apply to this tree; iris
> > iris_detect_firmware() still needs mem_virt after the load;
> > the base of the series is not stated
> >  6. Patch 7: NULL mem_region now means "map internally", which
> > weakens the -EINVAL sanity check
> >  7. Patch 6: redundant second ioremap_wc() on top of ath12k's
> > persistent memremap()
> >  8. Patch 6: ctx is set under one scm_auth_enabled check and
> > used under another, which is fragile
> >  9. Patch 2: the context now carries the full region size instead of
> > the MDT size, which matters if use_tzmem gets enabled
> > 10. Patch 3: stale qcom_mdt_load() comments remain in
> > iris_firmware.c
> > 11. Patch 8: no issues found
> 
> Thanks.  Will address them along with Sasiko's one.

Just to check. Did you verify your commits with the lockdep and atomic
sleep debugging on?

-- 
With best wishes
Dmitry

