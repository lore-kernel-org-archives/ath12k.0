Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7A9CDB471
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 16:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpZit0nzAD1TX3LmUuhtrO8wq8/DhirAmsH9yXDIezk=; b=yK04MLgpVSo5DXQFf5d+LKrbcL
	tDsoOmQckq7aZxt0AunOcaoZXJ6G4Nys28MJGbAKphZApLUvt7W+mnULfEsL/tF06cxsMtOLdy6Sg
	IAe8vgDmXTvVH+fiKFGoxiE168nV6YkcGAk+0unTREoaxIDwP+/wGpMHTyDQ9XRMIaUVdGITjLQeI
	dfrsGMQSMkCUKPyJy37+DLdKnkPSv/wqsrmBeLJJjN4xR9fNL5d/8mcBScg2tzOliODu3kc7o89Cg
	U4SqE+JFvl8qsN1AJ4iPEeumrp5Fy9YFXEuww5GlqbXv8cfv8F6+jXfhAZonQzWILwxFm7sKr2T7V
	aAlSC+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc42a-00000006cvl-2JzG;
	Tue, 23 Jun 2026 16:32:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc42Y-00000006cvQ-1Q5Z
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 16:31:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZD9b031271
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 16:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpZit0nzAD1TX3LmUuhtrO8w
	q8/DhirAmsH9yXDIezk=; b=ESUWwHoB/PYrdnzgspHK50aVHFG9HG0SsYqEfjcK
	zy3aoaNgH/czKeAZ0dhYEzvc8zj5J+CgxxbnedXTsuYRgPWHLPc2PFl5NVhl71B5
	RzAZ1QTHSeWoAg0DmOfZuqmnTFoJ98qSXI13pKXGoBq6v22b7zOvt8Tp8WiqEJju
	p9oePXq6Oj8Um594mC8b1BhgZVi78fg1jRXMfsxb3w1ShooV4RrqzM57YviXD7BM
	J8FvAdOBL4AMuiWP0Dh9PCHX85HUP9B4Te7sj9/puAK1R6J42yxzqKsFGGXnfzfV
	5f8fJ05IbJCt/q4yfE+sukmirsLHgEPcUWhEzCioqzK8Zw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe69tux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 16:31:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8a247a74b7so3414830a12.2
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782232316; x=1782837116; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpZit0nzAD1TX3LmUuhtrO8wq8/DhirAmsH9yXDIezk=;
        b=I/yp7QHApzVhel0Ld5SBicN/7HNSswhIydczr5o7R8a94YdevODh+yWLhiTR4uSgrA
         fG9n/tZxuJz8Pt1gwEZfoq7Z3kfNQcfHeNYD5rlbGPcvzQxFKDZdAfuh/8a+gX3Pp7yN
         bLIdHdIaW8muwNvhe5yIFVnnziNF2szcUlZ/m9YmDzr6sJSanCbiGzEJYE8npEwRGzPF
         Zaed0HgEdaqrKtb1EE+JCMbkf6l27FGBavACXEY7Ms3F1QU8It8ENRpB7KO+52GqfE3X
         o6boPWuwB37GHHJfOGdiA02Hhf5EX7gAVCSV60WlSbs3AsuHE3A+NciX8ag0Wy+ZEqJw
         poDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232316; x=1782837116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpZit0nzAD1TX3LmUuhtrO8wq8/DhirAmsH9yXDIezk=;
        b=PrBrGujBnjUFhkLkd2GJ7O47EMuI7sOl2sXpoH3Dd5akhB9RrE9bV83PXBw1ZXLZNR
         qu2Go6bIRmQMIjDbbF4FYwy8bOkY9Ckt8VRYU0/QR8+1zbfBppDlO7Ar77mdc5cEo5tp
         /bvA02lXv3k/nudtI7S1pCRm5OQULqGbgQMgt6Gz2VWWGXqWjDRGq54O3Jtx5rKTvxPF
         Kt7eQRZL7iigic0VxNNYHUJP2oD0/tShiAQb4MUtk3hR73ctjdITEV2sVPD6GZ8B3Moj
         B9wFwnV2SGrWMJZ11gU0zFFYxyNUkPYYBk91IrCVBxoS8c1rCZ7e2nXy92nxFO/Qck0I
         1EPg==
X-Forwarded-Encrypted: i=1; AFNElJ/WyUSTG2RFf0YcBMK6rAwMuR8BQ9wrZinLrrrB2LHc0OksDvke9kdXzrAGyuAGoneQaFfgT9o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmvj04mXMm1GApMH5MRBTl/m2seqm17cSyUh10WcghF8PRehF
	HHJ8aovvfy+SR5Th6ZTgELfN71E7sX0+cWMS+y3VF+FlE1GTKqL0YagMqVQCX5A+BKbQg9cs/26
	5EhqEG6xOUE+Lv69heuGMYWGpi4dxTvkdiaK8YTSicFRcv8g6tWKYcOeoUGTeVXmm
X-Gm-Gg: AfdE7cl6MZj7DjZ5UF4adqW+cbaJ/p8oKx2iKMimF0HEQ/3HZnV8CIFX6OytIekPB3X
	Ul8PnLQBN25njhhrCokroGkCuUyURLRQxYvB2zqfPfBH3LK+DiJll+BVCPlpxv6OiYWKhoG1T4u
	izHc7eeSnGbMe7xXAMBwM6OuBn4ajZCubjw5iFugpQ9rms2dJLWqB91RYeOHj32hSMYfnEDteVX
	7vgpvDX0FSVx2BA7i/SRpcdpoeQ91V3rmKGQ0LU6lLDfuUuFEnPlPzcHFquy+fyJPMwHatzk4uT
	JsTBrtZPx/KZoEJ74Icy8yzjojjhYtoCHVxHIDPx583RIkH0FyAJOulecvDDcQsNBeR4z6l6Raw
	JNlJFtSnK8Tu++KZYi/bOCVWdJqpzh6PuLzipMQ==
X-Received: by 2002:a05:6300:68c8:10b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3bd151fd460mr2827994637.35.1782232316123;
        Tue, 23 Jun 2026 09:31:56 -0700 (PDT)
X-Received: by 2002:a05:6300:68c8:10b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3bd151fd460mr2827936637.35.1782232315599;
        Tue, 23 Jun 2026 09:31:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5a1dd9csm9850337a12.22.2026.06.23.09.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:31:55 -0700 (PDT)
Date: Tue, 23 Jun 2026 22:01:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v7 01/15] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260623163140.l7dvkqa5szqkej36@hu-mojha-hyd.qualcomm.com>
References: <20260522115936.201208-1-sumit.garg@kernel.org>
 <20260522115936.201208-2-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522115936.201208-2-sumit.garg@kernel.org>
X-Proofpoint-GUID: aZo8iYEftQtzfZl1-oQ3V3bCjYtSw69Z
X-Proofpoint-ORIG-GUID: aZo8iYEftQtzfZl1-oQ3V3bCjYtSw69Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNSBTYWx0ZWRfXwNUZk5K6ED9N
 QA+jvTng8V5eNhj03cUDPESRBEruUg9tz2TQFI3RvITxargpZXUGMaCWU/iPqssquYbg4ZSOvFc
 eSpY3aLqnfRbaYKCoQ50h79Wl3MKzuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNSBTYWx0ZWRfX0fBCSxf31EaK
 xZTJ2qkza3LQnIXJDiJoQMJDgszdyaBwFcHKD+SMSy4qJwIDM6D9k3P36EW8EdPh988vkZvKC12
 0IfxPVpi1qvYEDMAvvglyq6lnlsRkNpqrC6vXqQ//3aZbNwiDUXg7452/hdf3F6+UKcRW/GUVIq
 HNK6Iyp5zfO5ket1RkgrKkzsAL31788Lq0IU7c4Bn0kDpWV+jLIoSMEgj+Coy8emrkB1rF8vGWA
 0jcLV0b6wMilCL5mCjHdkcJ0yt/ZokPlw4eHrvhKfyB7yL27VbSJZLZTps0d64dhIFZ3hkphaq4
 n07n7clusYpedTk2euOyjqFo1AS0qRDKbwB41MXe39nZOb0udEQHB6MO3YZxeXSO/8HuC7c6Tsg
 ILB3sX6jaRQoDT0AOIz6pbxLeln29X/2529AU0K5fcM4MfyEcRTkAgPZ63xBkXNKgk+SCacY3rd
 YRc71JbILHaO1adPJAw==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3ab4fd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=scVuWRnFyv5x-Sid9UUA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_093158_495703_4CDA0C5E 
X-CRM114-Status: GOOD (  15.60  )
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

On Fri, May 22, 2026 at 05:29:22PM +0530, Sumit Garg wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> All the existing variants Kodiak boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> Note that modem and media subsystems haven't been supported yet due
> to missing dependencies. For GPU to work, zap shader is disabled and
> in EL2 mode the kernel owns hardware watchdog which is enabled here.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> [SG: watchdog and modem fixup]
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

As discussed internally, I will be taking this patch separately and you
can drop this from series.

-- 
-Mukesh Ojha

