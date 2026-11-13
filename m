Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFF606A327
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wzFtHXob;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0QAN3oS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VlS4BcR+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=; b=wzFtHXobgDqlSmWAeC8qyNAzB2
	PRbiPMtgwAFLAx4VyJeZOhmLfuWbRT4TW4gqyj5Ok0pt3FWmrBDo9e9mUJkwMa6qklMzvBrD2xy7k
	C0uERumPyT0rMLldqYrjmUa7LeFvfgOMRgRheYMn1OswSHXx4r5fJTrNE9ezD5ZprY2uwbVXyxZkZ
	h1PQLjvXO2LLCelPWqjr4yIONwb+1dwKEsb93OR8/kkv/8/iQ1QIDrXlcdvldPJOUZJ5Z7iXDImny
	9RqD0c2XTLPT7/a2Q+NrZuzaexq1sKVGktY0rqQqoWefyHZIN5KRSlepWVGETJYfU3XTjViDM8x1H
	e2A34KGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRn7r-0000000CAcB-1Y8o;
	Fri, 13 Nov 2026 08:59:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRn7p-0000000CAbl-0h9R
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 08:59:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VS3T1527748
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 08:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaCKuWoch5k2Kjk0XZXFM0Ps
	5nVvPhDt20xb/z6BgX0=; b=F0QAN3oSkmjXryB+McqTbr0iaQSPYlX2D23jMe7h
	tH3o7lIq0mdVAPS+NNwkMN/su6sThmzr5sTC6xO9v7mkZyvnbXjnxvw9stqfpXcu
	WX4z5RJ5SGXcBNzRjGxmp0W1VsWwkmDBOxKfLXPQ0TvbWSdmdMBxrXS5a5OvVClV
	m7R7GRaNqMoybnGaLWBKUlTU7aNy7HdZcr+xdL5tSAFNF0aNjCZxUDFtX2IDTEAi
	0bKR0qlla5OEvln95ah2olXoL9ZIPNnFq8By72s0o1qbkSNbIssU6OyCnUZ3GIqO
	z+pk7uXuVDRoBN+peJP481m6eCkso7A2PyYW5L4Z4faLpw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8hsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 08:59:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1196771eec.1
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560351; x=1795165151; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
        b=VlS4BcR+MW0B4zEszJFOjnNdhoMwahyNFSKpWww0PbcXF511ri8XimWGUuIhZYaMWE
         +pSCJ6NpRRN/Ytw5m4BoZEeei+mP42c0BDc4fScfBcuzOerkySfugmIZKHuqVz+AlUn2
         HLvYNiXIGC0k2XcaB2HNy735dDBLKTjl0vUVj9elHNds5ym/ndv1lXTlxdw2NRXbXmMs
         99aQ9wr/RIb0BiARbXYBRL0Jzi/mRChNekunSBPtJasGU/PHqPQwyKEtfZYosuovfoGH
         DM//pVmy79/AoLRxbSR99FNeVf7jnPFUavlo9dGM2XL3xbzqkaluXVDSWd9SGEV4wrnR
         3O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560351; x=1795165151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
        b=BKP3t8+QdVgFoAilDUySBD36GUXJJDjFO9vaYTX3yCOFlS5NqM2IC4QDTLuiFFaoJE
         e91kYQF3r/T1W1OYResHRimy6OiiSv+uWd8t4p73/tYoFAO6HQTK7KH5quyjH6IXgz4r
         +GB++aGqBqNnBgw3vJBMVSZxReXhmhYSzWwxxQnz5yNFuDOIozPmrlEwy9cuOHldIlCc
         vhIgPEMSbgdGzPvbr2kHrblN3AFJXIfplv6slPI02qLxAe4IavePKIlmZxtTCVZd9qSK
         7Cpa43mWAO3Yqyow4hmrJ1y7vacBic77AadN/F5FLJbam8JaUrItsu961JZ5vLko8g6j
         RyUg==
X-Forwarded-Encrypted: i=1; AL+hErF/fwSjMb7hr9PnPinLWF60Aa7rnjP6jINnqZlQFSEiAA7mr8D9CKXat8Pz9+HXOm1q/jFTWU8=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Bo6THFNOg12lBDzzKWSvDwGntWDXBnAt9pSV2TRnk0elytoSh
	X7JvKqZMRqh1jCywj/yb6Ilx/GaviUKygPjX+rM03TyBKtOKJ4nJvqQA+YzICRBJZTsDDNtE372
	E9s6Wt6SPWOdWBzKNV5LQv/vuojXyU7mNaf/AFQ2fN2uRrRQg1pvzi/mS6ujK8UIk
X-Gm-Gg: AYBFou2gWekyEQOTSYJY+GO4OZc3bmKIv8AUE2jKi9fyBWNJz6+tsiMEoUVczGX9Iwr
	EosBCIjq0ZfHTCoRc6E9JbHqZPVj51jC8PnvzPyzWzTdO7OWDaAuqHfr2DI+oFtRPk84BO792Jl
	FizC9isEdA9N+tzNGRG/pKfpU92U8TFTYj9U3UCY35AZ1Nv7/tbTeGbw+YYQDF6M7exkyjsIZZO
	K3Wvv5VtSZTqJAxKCMyiXUziTX9JiTexr8skcpWa76yGfXHPdDw7+O7BfNcIc5dH/GfKXzl0jrL
	4SQ+FNM2Vtno3CA52ed7HwNEr1D/147dhtgtnbzmI130ChuwL3auCDowkYwJv4IytROrRLPaAPb
	Z4IXPQUwyeQj+pcD+W55nqp6PtpRemXCzr7JnrF8hp+vziI2pnkBocEN37yg1P99rsex7mZBkAs
	8=
X-Received: by 2002:a05:701b:261c:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5030684d9mr1933687c88.3.1794560350829;
        Fri, 13 Nov 2026 00:59:10 -0800 (PST)
X-Received: by 2002:a05:701b:261c:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5030684d9mr1933628c88.3.1794560350098;
        Fri, 13 Nov 2026 00:59:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm8926890c88.3.2026.11.13.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:59:09 -0800 (PST)
Date: Fri, 13 Nov 2026 14:28:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Alex Elder <elder@ieee.org>
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
Subject: Re: [PATCH 5/8] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113085856.mpa2zi4argm2e6y3@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
 <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX4z3eZQx2Y0RD
 VbgRi7IL1d9esbOqgVsxC+PG0PyVmMWPH4vGmr5oQ5n1S67eYbLe99aJ+xm2ta/Z/T6RMQ3Qq4P
 EWBQsFYYH7UUrnIrhUVlPp2OYVDS/v/qvU1OFhTA42tTtKymljWI7YKf4NRWmN/Jp4rDhrK5iel
 LD2lj1DSDw8j2JvnJvdG8m9bOiW6zkKWMaqcSjY7HNoGg+J0zZQF48luFhwmWSDIhCjdbVEi9iy
 cTzxRpW5a0wPwW31m+6Ogvr8XI/LessemlaWYyKExPd+/pNxIrI/gK7ysoGllbArFNZNYTt5vb9
 SqFTOrJ2OAx2MfqkjlWNAVb+9m/570pmU41UepWL4DgiguAC7jj9pzM2F+4udFhZE5kZQ38gvNm
 HS/ZJRaOyb4bX0p+x1M8KVDbghOBbtVaihg3hbkhZFqV+Spr1LU/t9AUo1vByQ4kd1NN2WaKnZ0
 FuKA8M84lSKUT7JW9Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfXywSURNL24SPL
 MmCGy8ZRz3hBo+JcNUKxVq4gy7e1VMUuW3vGyiYO76gYPW2tYuccZQBfntm2nkzXKZQfARy54tQ
 fg3g1q9W20piFs3Gw+YnpmvAs1ZT1RA=
X-Proofpoint-ORIG-GUID: -LZvsmNp6I9uBCooKP49JYBDqTL52bGu
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6d15f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=s4fcayaxKqd7nPnH_LgA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: -LZvsmNp6I9uBCooKP49JYBDqTL52bGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_005913_364765_832CABD1 
X-CRM114-Status: GOOD (  32.16  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 07:49:03AM -0500, Alex Elder wrote:
> On 9/25/26 10:57 AM, Mukesh Ojha wrote:
> > ipa_firmware_load() calls qcom_mdt_load() which bundles metadata init,
> > memory setup, and segment loading with no PAS context, then calls
> > qcom_pas_auth_and_reset() which skips the shmbridge prepare step required
> > before TrustZone authentication.
> > 
> > Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
> > with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
> > the same context to qcom_pas_prepare_and_auth_reset().
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> I think this does the right thing, however the IPA driver does
> not use resource-managed (devm) interfaces, and this would be
> a first.
> 
> Why does "qcom_pas.c" not offer an interface that can be used
> without devm_kzalloc()?  What if someone wanted to pass in a
> preallocated structure to be initialized with the (publicly
> defined) PAS context?
> 
> I was going to suggest that you just rework the code to use
> gotos and the cleanup path as used everywhere else in this
> driver, but it looks like that's not easy.
> 
> I'm willing to ack this but I would have preferred to preserve
> consistency.

Ok, let me fix this by introducing a new API to initialize the context,
which will only initialize and not allocate. This will also fix the leak
problem if the earlier API is called multiple times.

> 
> Reluctantly:
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> 
> 
> > ---
> >   drivers/net/ipa/ipa_main.c | 24 +++++++++++-------------
> >   1 file changed, 11 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> > index 14ac2d2faf7c..6964395caedd 100644
> > --- a/drivers/net/ipa/ipa_main.c
> > +++ b/drivers/net/ipa/ipa_main.c
> > @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
> >   static int ipa_firmware_load(struct device *dev)
> >   {
> > +	struct qcom_pas_context *ctx;
> >   	const struct firmware *fw;
> >   	struct resource res;
> >   	phys_addr_t phys;
> >   	const char *path;
> > -	ssize_t size;
> > -	void *virt;
> >   	int ret;
> >   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > @@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
> >   	}
> >   	phys = res.start;
> > -	size = (size_t)resource_size(&res);
> > -	virt = memremap(phys, size, MEMREMAP_WC);
> > -	if (!virt) {
> > -		dev_err(dev, "unable to remap firmware memory\n");
> > -		ret = -ENOMEM;
> > +	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
> > +					  resource_size(&res));
> > +	if (IS_ERR(ctx)) {
> > +		ret = PTR_ERR(ctx);
> >   		goto out_release_firmware;
> >   	}
> > -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> > +	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
> >   	if (ret) {
> >   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> > -	} else {
> > -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> > -		if (ret)
> > -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +		goto out_release_firmware;
> >   	}
> > -	memunmap(virt);
> > +	ret = qcom_pas_prepare_and_auth_reset(ctx);
> > +	if (ret)
> > +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +
> >   out_release_firmware:
> >   	release_firmware(fw);
> 

-- 
-Mukesh Ojha

