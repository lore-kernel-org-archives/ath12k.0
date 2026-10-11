Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E2CA9ED0
	for <ath12k@archiver.kernel.org>; Sun, 11 Oct 2026 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4GnUzarc/n9kpP41afLq33uqFjjFV9bhvTE/hjv9dU=; b=tFSos3mCXPzDtu0Mb4czeZtJNd
	ZAneTPaoZxDcub8aVlvcsD4J15y+UQ8Yw5Q7rzePnrvPE/shDUTuQosMf6Qc+ch1aQSizmArlCjaP
	etyJFGJnqQIFWmOlr9+ksgMK9EEjHiRVHpF/Q2lbkLETTHcdynUQCOiZhv8HaaAFyUGneP9myR4eP
	O22/9urwfywpah7tKAZXNIZBEro0JCGFhgHmM2Skxp4a+DczKEBVhFTm3RlJ1p3z1oFde8wj7cIYO
	XIA4Q2fPPCa9FiHBqw975M1PXu4lv3/VXk+P0s+82VPQyQxzrJdajoEQsGlMgVcGYCDuMihoQrHz6
	49wWICDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyCo-00000009Hsy-45CU;
	Sun, 11 Oct 2026 18:23:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyCm-00000009Hsb-1ZVa
	for ath12k@lists.infradead.org;
	Sun, 11 Oct 2026 18:23:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69BINLiM2748917
	for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 18:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4GnUzarc/n9kpP41afLq33uqFjjFV9bhvTE/hjv9dU=; b=jc6qT34I/IsNsxmu
	+vEiY6Z/HcWeE1+pk0LJ5BfW5j38Uw7kYf2kf8xz/zZf8CbnN7p7HIDxtN9pHNHk
	6VWK47tzwUZQjDiHe8YlXU/qRHF24u+oSc7C9MPeVv2EHabHUlovBM80itaJhuqt
	Xy147D9pWJ4yrpr+II3Udip+s4FMv6bni4AHs86VnJHoh8CKm8SH6Lzf3ARVC++4
	fhPWk5qu22WogjceN7O3Wpy/YVFmiRQi1DK64JhDMYlhKej1kOl5g/0yn4YCgy68
	g/FXE0KmVs+4nNYzrj50jQcQSf7DyJAtGUM1od4ovz2S2ljo2vX/PegGr7kQAdpT
	b+Mu2Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjke48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 18:23:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so3051868eec.1
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791742950; x=1792347750; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J4GnUzarc/n9kpP41afLq33uqFjjFV9bhvTE/hjv9dU=;
        b=CHK+CirGxvIO+HjNadoi/onOV5PDizBPsP3iEeOcWLCAXeXY//FB/vX+jDkA72u9yj
         PMjtgmzNbFZqi4OBCzZjehibBdAkChTOe1xDdx5KfjBvovuBUQsW6YYADpPVyJK0aoRr
         u01qYdl+GaFK3yhW6GpYVGu2dL7gXRWBJN4nHZvvwDEsz7NhH8dPUC8/4/eg/FclObYC
         bYKyYQjvwYUg7yBM/uOsKsSCzeqxoioGq3GYBlUW1pu+/Kk3ot9/XKdWf67wU4SnVbZv
         SNuudWHBPWVKmsy9osZgtrUbjvcxpA7/5LswRtDUA8c2HquqkRQN2076ORPCeqq6hA15
         g5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791742950; x=1792347750;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4GnUzarc/n9kpP41afLq33uqFjjFV9bhvTE/hjv9dU=;
        b=cQAJDWo5Bdnqrkh/TRdz5QiZOPfeqZLKywxGGfYB90Z8bfkc8eGgZric5Uh5I3iawf
         2POs1xSbvmTLVhaiWB87g4EMv01EO1u3qrfsciN3IIjRvchT5y6lgpRs/bPvWwFe/c5u
         mgpRQAfHCsMTTItANmk2sOok2rEIocGI6RNmXEBG6G2EQZ7vsH3ZDLBvjIljB7s3MatN
         8TmXRQpoyv4otx+HSzd1woZ72vxA1OHemucukarKrQL3Zwc4gzb/fKEq4H2ld/eGOFZL
         p8drWE6RpYjzy+bGgKi0OhTuHj2MtcMnF+ZSMpYPEnEvIWALy7RKvI3HdeyN/TvLDiqH
         HsOQ==
X-Forwarded-Encrypted: i=1; AKwUvBydMLqrStqGOjc6Jl46RLHx+LE7E8shjzlciicJ9dVKpF7PzmRePm1FPjyO0fZF4ugVBnyvuvc=@lists.infradead.org
X-Gm-Message-State: AFq9FYKjDWkcdTVLX5rTOXNH5gC/reMOvl+mI0IR1bth8IGScLIcgxsT
	X+Q0uN/pkeOfKNmZUth+hYL/XjbZDpFIhzY1B9BzydUKITXBflaoxMJsXOe2Pkl4oKa/PAvU6Ju
	hMUQrii2L648fIhqSq/fVGOiCsyhf+cOw/57SZiVnzXOq6T4kaeoiirdFTyVXMIh1
X-Gm-Gg: AYBFou0dESZTWysjJuKlQu417K7use2RvIxR1SsseWcGrbLzgJuw13naPErbyI5ffUh
	js8cMewd0pzWokFhCAOMpE7XpGDHxjzPfPLc6uRg1GfCLwvQZxJ5Lgm1pgd5Cg7Nmn2OaflkoeP
	R6OFKCLWalbuzgKrYcBstHj1HRtliGOdnahH8L/VOdkAwQ41ZxAXfitnrO9FEWXL4tLqJD9NZvA
	UHIVqZG+kKlpsCoGhMQdyGPQ97NVtUR9cbCioHZprvizEDGCaeNlICtsj5fova9IYumZzQ9QKC7
	8/sUQ1QzTR+dspf65XVzJTA4Z2l9K8UW1BcYxWp3VhTrGBK2QV1Cay+ucpSWEwxIJZ14GfSXQx4
	5POow2WhSTdlWyY2UMGY45AVPpe4otX5O+q8ZHugnTTKeI7RNxTq5ZYL8bA==
X-Received: by 2002:a05:7300:8a1d:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3537e0fbed7mr11835717eec.27.1791742949811;
        Sun, 11 Oct 2026 11:22:29 -0700 (PDT)
X-Received: by 2002:a05:7300:8a1d:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3537e0fbed7mr11835670eec.27.1791742949107;
        Sun, 11 Oct 2026 11:22:29 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3581f594a41sm17453666eec.23.2026.10.11.11.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 11:22:28 -0700 (PDT)
Message-ID: <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 11:22:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jgg@ziepe.ca,
        alex@shazbot.org, bhelgaas@google.com, jjohnson@kernel.org
Cc: johannes@sipsolutions.net, mani@kernel.org, yishaih@nvidia.com,
        skolothumtho@nvidia.com, kevin.tian@intel.com,
        linux-pci@vger.kernel.org, kvm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261011074514.515894-1-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261011074514.515894-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX+SDGORBOWkvl
 X1FROoEiW68RKaDCIMboEr5gR3IeAaKoWqvbxA1k0e+5ibdWlsAAldLEE2ElQwG65YCbcF2s6Jr
 op50MbEu2obW7vLG43MrHkaiOX3Q8zugcGiGBNpQAPdJxqHqh/i++BNAjeoPw51GaveY3wOI5dh
 6v40/A0ptFSUZZsMsD4m241wUOP3hEe2Zw1xJOx+mN7xSpXpZ3xeDiOSrK6EP5+SCXW6DqU/pA8
 Sh8lnp3VWWj0e5XO3t56ykP9LRgKCidJ9G3nWwVgTciu0IF2nNMFX4fU65bP25yfsWtyEnNs5J+
 7o8Xb1aSIpRvBdQ3qeaCVydC4t9+KTvLcdLs31d9MbtQSfCnprrfx8ECSEOm6O6KxKD8+3j9KpY
 2MshQ2FTZlo4D3CCcffN9aZjY3IPOPvFiaikYDrOtPLYd+izAQiC/58XE+t/FI3JsloM+ht21Y6
 FN9s7DoiPyRQ1xWAHrQ==
X-Proofpoint-ORIG-GUID: DoLs8WNE4JIXXROyktYzdwD8nn41puz0
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acbd419 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=COk6AnOGAAAA:8 a=vTVf00-0V6mThgBseXsA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DoLs8WNE4JIXXROyktYzdwD8nn41puz0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX0CFBrgRXizf7
 6A+9NdNhZ8wBxkBWnN5kKlWfZ5HTboFcPSkWQB+U2Um6tMXcYylPgmo5oNNszwXPkCOC1YGLk5P
 OWfxRhh1zJ3RqquAwUc9RD/Ro3s6Gg0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_112328_430266_41F00FF7 
X-CRM114-Status: GOOD (  22.93  )
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

On 10/11/2026 12:45 AM, Jose Ignacio Tornos Martinez wrote:
> This series enables Qualcomm ath11k/ath12k WiFi devices to work in VM
> passthrough scenarios, addressing a long-standing issue where these
> devices fail to initialize when passed through to VMs via VFIO.
> 
> Qualcomm ath11k/ath12k WiFi devices have been broken in VM passthrough
> since they were introduced. The Qualcomm firmware has its own interrupt
> controller with private registers that need to be programmed with MSI
> addr/data. The driver extracts the addr/data from the MSI descriptor
> and programs the firmware's private registers. In a VM, the driver
> only sees virtual (IOVA) addr/data, but the firmware's private writes
> bypass the IOMMU, so they need the physical host values. This causes
> firmware initialization to fail with errors like "BHI offset:
> 0xffffffff is out of range".
> 
> Multiple attempts have been made to solve this over the past 2 years:
> 
> March 2024: Workaround using module parameters [1]
>   - Required manually copying MSI values from host to VM
>   - Rejected by Johannes Berg as too manual, suggested VMM solution
> 
> August 2024: QEMU + kernel solution by Alex Williamson [2]
>   - Kernel disables MSI virtualization, QEMU intercepts config writes
>   - Uses brute force pattern matching to infer MSI data writes
>   - Stuck as RFC - no progress in 8+ months
> 
> No action from Qualcomm: Despite multiple reports, no vendor solution
> 
> The solution in this series provides a clean, kernel-only approach that
> addresses the previous concerns. The PCI reset support for these devices
> has already landed in linux-next (commit f8522a518e59 "PCI: Add device-
> specific reset for Qualcomm WCN6855/WCN7850 WLAN") [3], solving the device
> reset path for VFIO passthrough. This MSI series is the remaining
> piece, with both in place, these Qualcomm WiFi devices would be fully
> operational in VMs for the first time.
> 
> In practice, this specific behavior (firmware requiring physical host
> MSI addresses in private registers, bypassing the IOMMU) has only
> been observed in Qualcomm ath11k/ath12k devices. A device-specific
> approach seems appropriate, and the VFIO variant driver pattern fits
> well for this, following the same established pattern as mlx5-vfio-pci
> and nvgrace-gpu for their own device-specific needs.
> 
> Architecture:
> 1. qcom-vfio-pci variant driver caches physical host MSI values and
>    exposes them via extended config space with magic signature "QMSI".
>    Device-specific hardware quirks belong only in kernel drivers, not
>    userspace, independent of the tools used.
> 2. VM drivers (ath11k/ath12k) automatically discover and use cached values
> 3. PCIe link recovery handles VM timing variations
> 
> Thoroughly tested: 3 VMs across 2 WiFi generations, all devices
> successfully initialized and are ready for use.
> - VM1: ath11k (WCN6855)
> - VM2: ath11k (WCN6855)
> - VM3: ath12k (WCN7850)
> 
> Series structure:
>   Patch 1/7: PCI helper to find free space in extended config space
>     for device-specific data exchange between host and VM drivers
>   Patch 2/7: Shared header defining the MSI cache protocol between
>     the host variant driver and VM drivers
>   Patch 3/7: qcom-vfio-pci variant driver that caches host physical
>     MSI address/data and exposes them to VMs through extended config
>     space
>   Patch 4/7: ath11k PCIe link recovery retry to handle initialization
>     timing variations in VM environments
>   Patch 5/7: ath11k support to read cached host MSI values and
>     configure firmware with correct physical addresses, making the
>     device operational in VMs
>   Patch 6/7: ath12k PCIe link recovery retry to handle initialization
>     timing variations in VM environments
>   Patch 7/7: ath12k support to read cached host MSI values and
>     configure firmware with correct physical addresses, making the
>     device operational in VMs
> 
> [1] https://lore.kernel.org/all/20240322104912.94811-1-jtornosm@redhat.com/
> [2] https://lore.kernel.org/kvm/20240812170014.1583783-1-alex.williamson@redhat.com/
> [3] https://lore.kernel.org/all/20261005105436.83962-1-jtornosm@redhat.com/
> [4] Original problem report:
>     https://lore.kernel.org/all/fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com/
> 
> ---
> v2: Complete cover letter with more information

Thank you for providing this level of detail in your cover letter. I've raised
this issue with the engineering team in the past, but I've once again raised
the issue with your in-depth analysis.

/jeff


