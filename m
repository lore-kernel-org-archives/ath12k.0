Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C6606A31D
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRVNOf5x;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3TQBkVB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xy2QszMq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dXEU4fNstySwei7nZv6T8mycxD11pRJ5qnWjwSzk+X8=; b=qRVNOf5x6+Atlpu6IllmTZdyyq
	k+VgkUu8Cg1zDKQi77Jlf4kKk5TCO2t6fwAWB9asfgjreifpP/JFI4dykpXiUMzUtamsf5TkvKZ7I
	HJnc7qjN4Hnz48ERn3Mo+yr0N2gY+8Q0luwJQPPlMt4T2rWtdQvyH6bYzGNZKkGyZm108wWpPwK1z
	5eRF2O9lCV8Q06W+fA3cTPFlQaT+fWirbyMPprLYERANpGKY+0tC6j641V87qiVWiN7kN6elYjfPG
	4Zx/JNEgYsBfoHAvflYDZtaOW+soOKv2WNQeWgUSxAyyTE7jdtSs3PYmUAWyHoa3ijyEE1iDQZFpy
	0q8uCxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJr2M-0000000E0vC-2Jnk;
	Thu, 22 Oct 2026 11:32:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJr2J-0000000E0us-1dcz
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 11:32:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0B7c2918772
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 11:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dXEU4fNstySwei7nZv6T8myc
	xD11pRJ5qnWjwSzk+X8=; b=Z3TQBkVB20a5qG7u5iAzniVCA6vhy+g7rZAljzZj
	mkKDSbpW1JcJKAAZtfFabQV0ZGI7TqWZlqo3AXsayy42gSw7v6g+1gGBw7SjWB+n
	pI/1Oy7K2n9v5746SuqfhYWkIf2AoXKZx7NWoRzDGazf/PJ7zSDG0r8ITgSTVaWD
	X++JFG2o/fpng6QQASI9c5gvT9cyqvFpKlyEjkkUfw+3nMc2lmsStQqjA6rWtVn9
	7IAK52MAkALuckgcBtHxE8bPGBRQdIx6RxR4jgkbaZVBXDtVSD8N2PbN3uacqza8
	ACWxeRJbyW2J468G8zRfklcoM2HtzT0dNPxERQanw7SKTA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aaq6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 11:32:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-169846a19aaso720636c88.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792668762; x=1793273562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXEU4fNstySwei7nZv6T8mycxD11pRJ5qnWjwSzk+X8=;
        b=Xy2QszMqdj6pWI3Wa7QA/CyrBdp9bsmOlTTXxoGXdqdrMuNo39aERKMrqOanI/HVGa
         B41EbbpPX43BTv+iUFru4BBhW1LwLHtaFMuajbPyCLWRuYW7bmu12gO0ybU/izxlpyt+
         N4yB/NdygD40juEZwr7GlsjVcaAK4PmM4Q7jo6liNpNgGgabDe1fJzy4usAeRoSAkWeW
         hjrBcCIhmBXvyneW8h3l+2/cg+3jTlG9Ir6vXF4tcPme+6U2SIsEGLalJuJQvX1yUUFE
         GD6dvUqi8kWnEk1kLQxXZ5rkWnI94qAuVclYGcPle9fpZg9I98cHi7tPFxbQiwm02U2Y
         SafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668762; x=1793273562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXEU4fNstySwei7nZv6T8mycxD11pRJ5qnWjwSzk+X8=;
        b=1L/O3WzFRGnkQ86J5y+rzUA9oofpgLZBTXrQUaRMHKzvgzV3s04xyI58xMKa88Ae/S
         hbh8xe9OwnSHcfvVirqE828n1YoIsKrXhuqIZpECVlA8a6BhwEIsNtYBXdZlKXf7ts5r
         cP6j7nxBF2U8j3XScJslqLR5QUWWvW+wqnOseSy2zzkFhB6U7z0zNUZI5Zec0JI0PNmG
         /fJFfsJAM9GrZYPpot3fcsUVsqqraItkoC17IWvNJsGcbhrwgh+r2uaTcN4BSRa6xRJ1
         FwuRiL+Uy/VdCzwDB2wnAgW4623jwpGubam2PPlT8P8RaMVCIw9puumURlbajabk24tz
         Ph7A==
X-Forwarded-Encrypted: i=1; AKwUvBxTHIwOqRhVZG4q58rhEtTr4pLovPTEHEgKDO/xjAAyfjGr1wOxJOUXAj6i2Y8dCVNVYx9+GvA=@lists.infradead.org
X-Gm-Message-State: AFq9FYJWr9yv+dzm3DsP4WI02VMOwuRBmO99Qqzc6p8y8tejZtwfpPbP
	c/VsRRcHWKQU9nYMpYlv5soGShv2GRR00+3SeM2FOh5Z3IJCoO/6PupoV3APmLUI/kHS2Snb67J
	TvPg7+yBRpaohEqGJwwPMypUfKrkoAZwScKxXgbgq/6Bo68cGOhTL5X5g63qYtwdz
X-Gm-Gg: AYBFou09xFObV6JXODlImQhbo3AvS7e0WTla4R39urVUpz+y0s7J1gxexLJyR2mZecv
	TPP3InBQ/2rqoQZeMlIOgxg6NSuc8J678Cc6j170IGwxCXyWq9605/NKZ9AzN8AXy9Ltcn2K1SR
	CoEs9lyq7Q4xSxqNxhyszib/+aQPF+p9YodIBNnw10wv/a0NhC9mmSQmucqbFB/BDnK3k8LC6Md
	/WFQLVKcFdLYt9AOkECVXdYbW5z8QPAbBTDUMOCYmLj40MHkDUw5SbzaA7eOdLRlkuTAwRHExpg
	BZmGDBkFlcwEFxNiCiTAh+a8MFkfFJfK66zAvCQVnoaNtkTs+2yrqL6yajpoQRRnODj1BizS+/X
	zXrLzia24j1aFdAa/AIq/X4h4Zw==
X-Received: by 2002:a05:7022:fa01:b0:141:5281:8a41 with SMTP id a92af1059eb24-190a4f06512mr7988815c88.9.1792668761636;
        Thu, 22 Oct 2026 04:32:41 -0700 (PDT)
X-Received: by 2002:a05:7022:fa01:b0:141:5281:8a41 with SMTP id a92af1059eb24-190a4f06512mr7988744c88.9.1792668760893;
        Thu, 22 Oct 2026 04:32:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-190e29381d9sm12143730c88.18.2026.10.22.04.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:32:40 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:02:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <20261022113226.tfuhxqrtfl3c4kcx@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
 <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
 <zqu4sweaftstbt26v2u3ajzv7snnqswuyrktm7t7k5gh4zi77e@d6t2fpsinvxc>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zqu4sweaftstbt26v2u3ajzv7snnqswuyrktm7t7k5gh4zi77e@d6t2fpsinvxc>
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9f45a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ZHN8ZsQmYYvh4dXIsskA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: r-9rgV5-opZIPr4GarTKGb4E7FdmFKGt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NSBTYWx0ZWRfX+2LJCG1HbS71
 6BXbu437LICCScWnNcD2y0U7UKjDrAdyxdFeOhJelfI6XDDHhVRch42PKPcYFvm3keETJgp9yA7
 IC3HauOPdAFo01N1SJyF1eraOcwC+Xg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NSBTYWx0ZWRfX5PCDXJL9WVUe
 d9sSD39ssBfzjDQn0l05/CRwObfcXtduNF63L2l1jnIdvd1Pq3T8f6u1CJiy34l8R1yzTglBHaW
 uRCQ0e+Td0D2LQtsUjCDPSjK8a56f2DOXXzv8L5v7DhFV/DtJ33F2aXZun7/IYv+UCgB+vTcWAg
 l1Uumt7q7PfJrmn1DgDZ6cgdCoOR1KFXf5eObm7BrN9FFLk/NGysTlO61F/d23k/eGpRNjoAhfz
 bEATBdOIQrGF0Pvw3sN0OonoIFD+j8BTNCR4edXHrg3lvs4CwgNCJM1pGRhncBK+hqhBxCc3AmT
 wc5FhpUOJJ59PvSQhpBZDryRy8b8itkjZrCzyvIwe6Fv67H2x2/ZgLPglnG2UYKZn6xciR2X1E2
 sg6JLvx8VsoudNPS8rvT9kTMvAm8lVmfbR7rZgoZMQRdZkEJm+/4rxv6sYcneVqfv6o91wqURkl
 ouUdRqkvXCzM70JOyKw==
X-Proofpoint-GUID: r-9rgV5-opZIPr4GarTKGb4E7FdmFKGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_043243_455044_255B4176 
X-CRM114-Status: GOOD (  26.42  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 04:19:59PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 06:37:35PM +0530, Mukesh Ojha wrote:
> > On Wed, Oct 21, 2026 at 01:32:13PM +0200, Konrad Dybcio wrote:
> > > On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> > > > In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> > > > public function, migrate every user to the new PAS context-aware API
> > > > qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> > > > 
> > > > This series migrates every remaining caller of the deprecated APIs
> > > > (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> > > > removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> > > > 
> > > > This series is based on top of although no dependency as such.
> > > >   firmware: qcom: pas: Make MDT buffer retention explicit
> > > 
> > > LLM has the following comments:
> > > 
> > >  1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
> > > reload, because qcom_pas_metadata_release() is never called
> > > (patches 1-6)
> > >  2. devm_qcom_pas_context_alloc() is called from repeatable runtime
> > > paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
> > >  3. use_tzmem is never set, so the shmbridge prepare step never
> > > runs on SCM and the commit messages are inaccurate; TEE gets
> > > a real mem_phys/mem_size change
> > >  4. Not bisectable: patch 4 relies on the NULL mem_region
> > > handling that only arrives in patch 7
> > >  5. Patches 3 and 4 don't apply to this tree; iris
> > > iris_detect_firmware() still needs mem_virt after the load;
> > > the base of the series is not stated
> > >  6. Patch 7: NULL mem_region now means "map internally", which
> > > weakens the -EINVAL sanity check
> > >  7. Patch 6: redundant second ioremap_wc() on top of ath12k's
> > > persistent memremap()
> > >  8. Patch 6: ctx is set under one scm_auth_enabled check and
> > > used under another, which is fragile
> > >  9. Patch 2: the context now carries the full region size instead of
> > > the MDT size, which matters if use_tzmem gets enabled
> > > 10. Patch 3: stale qcom_mdt_load() comments remain in
> > > iris_firmware.c
> > > 11. Patch 8: no issues found
> > 
> > Thanks.  Will address them along with Sasiko's one.
> 
> Just to check. Did you verify your commits with the lockdep and atomic
> sleep debugging on?

For this series, I did not.

-- 
-Mukesh Ojha

