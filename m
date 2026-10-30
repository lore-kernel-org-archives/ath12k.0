Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEFD606A31C
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GyUuTulf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBFHhwPY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKQaqCHi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=; b=GyUuTulfuhsoEuaKvS2JStqYAH
	h/wEYiFS/SulN5RsmENZPTc+CBR0nA4O+GamMrB8yGRNHsBm6/WeNvJ00qEMrvQkojeMO8+CeHrwN
	FIWJnPYNneaZucF2MvHSF5KgVE7L5CNYFn8NTmY5LHCY4R3+1/S6TyNSnaOGoeOLKq6Ms6UrLGen0
	j/SYq1pWl9b82rtV0MsK2Q9H7ugBAQ9doKZiWvLoUaYqAVVUPpgdbbwSUyGQH8sT+pIOXEyZmqxcs
	B6f1I+fwNqgTgznO/UAlekdDggm/MA7of+xca9GZWp2+fEPAkE0cjG8zrsKaH+OdPQsPD+4+WXcnD
	9h9o937g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjRR-0000000BLRl-3P41;
	Fri, 30 Oct 2026 10:02:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjRO-0000000BLQw-2Vpn
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 10:02:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F3wj3308794
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 10:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XPOou6CQafNHNZDV+h/LKdSD
	2kkWtiLvC6RPPBJtYFA=; b=KBFHhwPYr++jbg4TF3vSjdJW1POzBYkAi3+RvfSd
	RtzlrtdMwBBDIaJx7+ddGCxoPXXfmqWm7EkxNxwTiKaEcrFSpMBa4iZEtM3d+eTU
	BIylE7jUINtqtnmJpg37mM2mJdqS08SL1ZjE755XYPuNUalOxi3xRMeTeZKKCjeZ
	EbOL8tbpLV2lQgWI7m+wpdOue51XGnlbu50aUMb0EZ0v4QVqy4tmZbIl9PIM0J+J
	eiSzVyUm/6rX/jfH+EPgir2UQbmcjw40pAZwGygoR1r5wIuOiTq6yMx1YdVlZIEN
	ad4DhGtxKOQRaFQQ5SMFS0d4E87WWuYt78zNnAjLxqNc6A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qtbxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 10:02:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1467279eec.1
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793354548; x=1793959348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=;
        b=aKQaqCHivXlBuR1L7F2mI2GwY+fAQPj4PfFEZ2n9bhym1INEjJiyOJpC1vYBAJOenP
         Af4hjI7X0QnH1PyA4pIVD1JeNo7V7Upzdzj+LpCc4xEoIUMKbl3/35zNd/6gkB7xnaoM
         +TN1dcLBdc9C1a5ph/BjkzoqV9HSEBUen9oYDFGQ3V7WDgd8U4X5ALKoAubl/ahIINVX
         4gnMnC2QQDWf+kStNTq2MoFQr7YaTvrY30XYmyt+M5MhiLTC5MYYiBB0P76tdNPe7zz/
         fXADYs5UQiftmHdv740/t8tVMMzBwFQn7k7uNsfEifvosBMnbRvC7aiaTF5Srf+87/bS
         YotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354548; x=1793959348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=;
        b=lkiHs5Kg/FHnUZDAPhdsmdi5m8yAHK8miU+tGHW0Nw97vRMyCIYaGUbR7CdlTWJiEn
         lKtHbjrkZdQAWFAfWt7KIDmtCBDRdZaI47o1K3U2lIU2qTTC+39Q76zPlk0u6wG2vN1g
         YDQXYBWDpeEWIarCAacGOx0VMx+vyth7EqyFvocPgm6LF1c9a8qvvdXa8wbi4x4bb0UI
         EKO99L7HMVR2kweMBnP4rE3z8TLqw310oQG1rbAXJl+C1rLGFkHPogSOcwWXBrJQrBs/
         8LBZsFBxCaI9mFEUfyBOCe7WBdo+YcarSXOW8GeXJAa/rXKXFa4KiCPYufARQ72kH6en
         Mymw==
X-Forwarded-Encrypted: i=1; AKwUvBzP7K/VGQJE7DQ7myr0SyTR1rAM6j3i8GzuVBOH5pRgYf++mVKE378oESVtgykj2rHd9XcTQUo=@lists.infradead.org
X-Gm-Message-State: AFq9FYJKMGKbKM6PQwOdTq2qUbUN05i44P6n3OZe7tDT/66CwdLB7IW6
	/ZHa2sG0tsWm1CUg+fn9Equ9b3R1A6Zw0P55t8lyW9hLqHJGmWiJHOTETMlw0FiqfMzJshYZCsY
	q7tlkV+XeKN6Ph0etb2Twh0Jb0Kr3vKUcf/En8c6nbaqHlPUOJdBVwQ+EBfoafXS5Vid3A1JLMA
	M=
X-Gm-Gg: AYBFou1uvPBamecMz/u/+hA/OUxcHq4PzvhOPIM8GrcF0YnYkFMz/l2+simtTrTOzjp
	gOdT01RmSpHJFluR4zdxpZThX6ZKPz/on8MIR6O1NWN2uUMiMcVGyyM01ASJtVrGJmL/aM4Bg0i
	tZdX/SqljfYpYbPhKR/83HyzUufLUTeFdnD6dQoAJV12aoNkohAbHVCt8aJPmgdtOkoz6gfgcb+
	SYSWEIekYaqF1Z3FHABFUCSAgQkUivFPv68p88KtI6ZW1h8AbG0hbarZ7TuHyneU/vpaNtvuHOW
	b68XXVOrbWFfYDQeiQavzxBOpldHiSoQdRGBA8mB6t2y7I+wbEKuUUWk0790uPjL/GBs0MMHEjL
	HZ8V691iWCzkVogYI0iKWoma3meRU6PWbUi32f00PjuBzG2qN+UUIe1rwmepRGUlYbEoXv5xK3z
	XztWvYctFWsoSFTtw=
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr2702544eec.15.1793354547640;
        Fri, 30 Oct 2026 03:02:27 -0700 (PDT)
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr2702509eec.15.1793354547051;
        Fri, 30 Oct 2026 03:02:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm6925218eec.29.2026.10.30.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:02:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:02:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for
 default memory profile
Message-ID: <auRrK4JWN-7rUcG5@QCOM-aGQu4IUr3Y>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
 <2026-10-29-1-daily-reply-0011-ath12k-rxdma-ring-7-3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026-10-29-1-daily-reply-0011-ath12k-rxdma-ring-7-3@kernel.org>
X-Proofpoint-GUID: wI2baresJxJGZDscqswyGJJm5-8CrU9F
X-Proofpoint-ORIG-GUID: wI2baresJxJGZDscqswyGJJm5-8CrU9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfX8pnLs4R6BdPY
 Bwj9A0y0+J2yiA99+O/tRP99P0tDh5D8o1ouQCfeXJuY2jt9JxpS/JZh++bzjsXWQaCMQt29JPw
 gAjvHBn4awGWwj6mSMAIvVFZCA+Idzb/QRbxemjmAhQpNVs1Vb6aNbVYUtz2rPeZ92nIbl064nQ
 +vICh6ruGMLmkXpICxKwcJJWgkLhUaCafnWpAMFoWAU5j4hd/vYGQ+98A84Th20zvBI+aJhElE3
 gFniFqLbM1vfUjTFei120NVLArlIh5z3rNBHE6eFHnrzsnKSOFYLkE4dmh1IyZMFqXDKeJo4Io5
 t4sr5s/+4Btxx6O5xL3AG/5ZA8aHiORK1qJhqb25+TCriTM8cY8ObpqcUI9virecftXfmF0o1rD
 77sA/mF0y3WIsSa9MSnGcyoVSZNUYT2gqIcIABhRzmTC6+25q0mEYMPBQrsP4dkJmOgkkQYEBRV
 gOPpPtaDL4KP9XYpsRg==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae46b34 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3Y6tUoXcgYOYlkcqMpIA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfX6k6W2nMT+8T7
 r0gdFc/JvI+RtmTGNCijJQV97lwbQntxn66FPC9ICo3vtpe9dhWMG1pP5pFoCkQRwo5xos4ugG5
 omNwpW8Dj8d5sd7jY3DMrtVT/UchC1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_030230_753410_C69F3622 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 29, 2026 at 02:43:18PM -0400, Sasha Levin wrote:
> > commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> > commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.
> 
> Queued the upstream chain for 7.3 as Greg asked, rather than the folded patch,
> thanks.

Awesome! Thank you, Sasha!

Shawn

