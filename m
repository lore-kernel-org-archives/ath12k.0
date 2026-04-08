Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D436DFD5F8C
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xckB8PPJx6+/vCorN26HvLDMxAJX+r/dYxdwC1AmZgc=; b=AtnYsPSxeZurRt6CWPGF7e8idH
	MglDFBQ5G0gjrPWih5AyHU4QiXLmskENzTf1OdCZcz2uecEVmD4qaPxX4OAxCL6BbfG4uDLUaBnkS
	ZIzImdMnLTP/rbUTt9TzAL4mqvlIpePVfdPgqEDoa5QPJsw7MGA+F8jXDbss9MYbsFaWM6gUn6B4o
	xqVV7+SfbF+o7u5q2zKSFv6ehRzUa6/pdKrOh4jGj7TTWMcMQqwwkvdIf+8OozdWJ+F0pgmzmWQs3
	ug6gJrQfGJsNUIn8iRcd9wTz/+HExO63RO/PToJAqm9EFIYj3pBHzHMoD75MiQhnDtwa4cu7jKlQq
	mkb/os2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANP8-00000008RKS-2XHd;
	Wed, 08 Apr 2026 07:32:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANP3-00000008RK0-3XUo
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 07:32:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637NfXMX1259209
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 07:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xckB8PPJx6+/vCorN26HvLDM
	xAJX+r/dYxdwC1AmZgc=; b=nW+T356eFEiWlNV25OIPnYucbssv+TRN/QY2qRAf
	QPRvHVVopBSmj/fSXs0NgBVDsJ9QE8h2ok+x0hvLsG6TiUlkCg3wObmLBv3a7kyl
	m2nzw3uI4iNng+JA9e6cvv2Wr9/bVrWoP9AgCaOtYp8dKr0uxx8E/hlWlK1ZeVQ3
	WEMSL+o4zXWOunDSRMY8navjM9E6q9a8BQsXTSnLcqh6IrTx2LaLgYKULpd1TeUY
	/UDWZ7IRiI7V0ojXtEFPxFq2jCCBms5mBavoeF2GzEXNoWRAmbYzsK4rZpqtAOP2
	9hwyvyzYAsDYq9cz/CCF+9umhTFAznHxI/Lr5T7DlLXzWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttscd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 07:32:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso43415261cf.1
        for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 00:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633564; x=1776238364; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xckB8PPJx6+/vCorN26HvLDMxAJX+r/dYxdwC1AmZgc=;
        b=U+gOaziqNJcSlAAgCCuHge82Q71Q8HL37b4MfB6QwElfw1FgY+4BEqGdx7Z85jhYuD
         iKL2LA3yt0iGuccVW66YqU3b+iOw3FSMq1DY9p0Vn2YNOr7BFwvKMm+MXNKuqJVyEMnz
         oMjpU6ZItxgIoQ4lzFGAW2L76jMEJPG6n7ikOKoWfeUM8bYk0ZoQw2YK2Du7sJljb69H
         kI2ZbMSaKkaHFMsUwnlCY2N5GScaRXZ2aDNUpDg6z0EpWG3E6dv8sZkUKC/p9/tIyhyF
         t1OOjqsrewFQ1Jv7f3w+CK1jr35O3uIiUmPgyN+PiWp2yeofUxYWbjxnDbYGof+9BAWC
         6SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633564; x=1776238364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xckB8PPJx6+/vCorN26HvLDMxAJX+r/dYxdwC1AmZgc=;
        b=egqaZVxRX43Hh+QtpBjFwYYzYwrE8vM6RzeW4g31ANRs9nli81px0ft9i0V/wfc8hJ
         d3dBlGR0fTAsSxK45rcR7pEfbcULJ0CSeUJ4foacgoPu6v2iqPXmL993iyVmc2nIfLpb
         WQ5LwfrdKleFDlcFnU0dsSMYALZUVVxcl5s+PFyHDJJNVxLWNlt1e3ofJM6ayEj7KcT/
         gqPP5JF0/iYTgv6Vzvklgzrqtcov3/tAnlHqJcmUpVx6qbPAeZjnVuzvqJ+EuepR8fN2
         TP6jkGuedfR6gjFKDshqxbS21a6jfgDnb18SGCrOfA9f4H7ZpPW+CgjERTSKoQxYIYZi
         amrg==
X-Forwarded-Encrypted: i=1; AJvYcCWL+lfw+5HSBlPguadVkC+t2toPjHWENvVOkSL+bVUPFqsxYQiDx2JwHO3zFr0Z9wiQZ0AJsuI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGwMZQsepwybEhPmMVE9Lx8wG8hP3R/2afkTDFF6hJQG/UhR/P
	yC148xpTavOpJwJaB1gOgrBEqDPp1frvyNMk1MP3bRNekGjTX+cN842JAzxWC1U6nwQoHJRbHXl
	AyhjDxk56epJAmJaP+BsgHrbT7jrhy513c4KtBZLjFAbtGkTF4ADy13QC2NsQr/8G
X-Gm-Gg: AeBDietou59v7+jHOx0M6zgW0JvU9D3tR+3YU0APZUuyxRFlJLweODN/55hDh7Q3RBX
	PtTipcveSbcNv81+BAMBQGhwyIQ2ZON8GNgnRvC6jof7ulfV+JXpuzr2QJrI8S/VXqxI5ObRiqc
	Idh/la7yFjUnsJeAWLSJLIH6wxLfEIA/csLgapb2h6byLfh6Pi5N4zxraTgHx3qVVMBKPqXUULA
	a1qWYvGk1NtciGaKI3zoAIGKLl3QuYZUQKg8r8I+P98ddJQJGMQkOhyx6esEfqfinmhXxMxo0Q+
	Cxan9VhJfiwmvgrGJAQgeb8CFHqJsT9DJ9XFBV9lcm/Zd4ei0N2Fg7JnAlKScqw5PheQkNo7wvB
	29DDQRbiP5YkntHWI0i6xedOILQJ552/7MLFfIiPqkQEGeEpQFxNUeVaG
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr202934281cf.20.1775633564127;
        Wed, 08 Apr 2026 00:32:44 -0700 (PDT)
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr202933731cf.20.1775633563612;
        Wed, 08 Apr 2026 00:32:43 -0700 (PDT)
Received: from trex (187.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889cb46adcsm383692655e9.4.2026.04.08.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:32:42 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 8 Apr 2026 09:32:39 +0200
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <adYElwM6eT5T8hZM@trex>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org>
 <ac-KQ7e8-syph1Zl@trex>
 <adOcMsk8a_Clb4WZ@sumit-xelite>
 <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _GhAfeJyb1oBWAoKEriY32AfsYeaQJ0A
X-Proofpoint-GUID: _GhAfeJyb1oBWAoKEriY32AfsYeaQJ0A
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d6049c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=VPdg2FrOqWfiVCzsz0q0YA==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YTLieAA4xaQwPRX2avwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NyBTYWx0ZWRfX5B8GNb8UiblX
 iL5nj+NJwshLahgUc1hXCyuiGnNoQQsUcH2oDuL075RPLrBptC7XhLBwkVeppm38RbzYU/qoVIK
 PcRajNN1zHR+0a7fjaIkSmQHsjhFlOvjXxGuIg42s0BE59vPtQuJk9p7EpcxcHsJ1PAtfO4yWBU
 yORPy5wDFPX//mRJD15Qqb8334MX15R8EGiF+L4MII/tBS+zqM9Bbc/eHcVd8y6B8p/Ttnur3O5
 MjtyTKhF6aUQu2cw1Lp42TR2uTBX5F14SxQHo0bJASnMM7HPbrheEdpLCtZaJX4FW4BOhbVSz7L
 C6lFyszPb3agZ2ySVrr65DOI6WRHm9gcnWppd3h52mgpyJLOrFjcH2Mk6Z3yMx89FayxULkQ9WA
 0GsTI98ZMi6bXes7ZvaWRxrvJ0re5q1wOg9bLwic1qNnS1qqLnn3Rqc3ltZc1ugITHtPwwZ6E04
 T7fRjJvGrSOVouo9vMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_003245_998416_86876605 
X-CRM114-Status: GOOD (  28.33  )
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

On 07/04/26 15:14:22, Trilok Soni wrote:
> On 4/6/2026 4:42 AM, Sumit Garg wrote:
> > Hi Jorge,
> > 
> > On Fri, Apr 03, 2026 at 11:37:07AM +0200, Jorge Ramirez wrote:
> >> On 27/03/26 18:40:39, Sumit Garg wrote:
> >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>
> >>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> >>> TZ service allows to support multiple TZ implementation backends like QTEE
> >>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> >>> backend service.
> >>
> >> OP-TEE based PAS service relies on the linux driver to configure the
> >> iommu (just as it is done on the no_tz case). This generic patch does
> >> not cover that requirement.
> > 
> > That's exactly the reason why the kodiak EL2 dtso disables venus by
> > default in patch #1 due to missing IOMMU configuration.
> > 
> >>
> >> Because of that, it is probably better if the commit message doesnt
> >> mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
> >> implement the same restrictions that QTEE (ie, iommu configuration).
> > 
> > The scope for this patch is to just adopt the generic PAS layer without
> > affecting the client functionality.

the patchset cover letter + the commit message + the OP-TEE pull request
being referenced gives the ilusion to users that with the current set
they will get something functional (they will get a broken video
platform instead if they try to use OP-TEE).

That was the point I was making: IMO the commit message walks on a thin
line of "completeness"

QTEE and OP-TEE at this time implement different use cases (Venus with
QTEE runs with Linux on EL1 , OP-TEE runs with Linux on EL2). So maybe
worth mentioning this divergence.

> > 
> >>
> >> I can send an RFC for OP-TEE support based on the integration work being
> >> carried out here [1]
> > 
> > @Vikash may know better details about support for IOMMU configuration
> > for venus since it's a generic functionality missing when Linux runs in
> > EL2 whether it's with QTEE or OP-TEE.
> > 
> > However, feel free to propose your work to initiate discussions again.
> 
> Vikas and team depends on some of the IOMMU patches to get accepted 
> before they enable the EL2 venus support. Please reach out to him
> and Prakash Gupta at Qualcomm.

isn't Vikash in this thread, he can ping me too no :) ? but sure, we'll
synch later 

