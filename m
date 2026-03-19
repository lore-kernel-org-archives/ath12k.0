Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF671088E72
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 03:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b3s3EAjr8009h48cjzBmOUcZa2ExsAEz1rsedC2Zbw=; b=hSgspCJykT9iybXWOXTVi0f1sM
	ZnpRoVx6KAFL0KkyUdgVUuyweZfEfWDhlxP+Zb1Kjf2Sq4hEdZOTLoBmzax/9YITn3njSKHia8sbz
	VQ6ust0oZZk8Dgyo3DuNzG5kq/IiV/5xapp3HRjiiZhGzfb2Bs5/0s77rpLfXRuQgOTFzxfWMTdMO
	ia1/rk539Rt0ckuc1fgpLYBM6sW8+sdMlsqh0d8DJNY8LeHQL2jEMRT3iYzg3QteA5KFFyIxgRlFC
	PfrN88/Beu3xArzsSWPn5cst7tCsdnHziHV3R/kH2CI/3uoiO3J4eHaOelcP0oHlJup86Cie0Knsv
	ikdGOm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34Lj-00000009qrv-0md8;
	Thu, 19 Mar 2026 03:47:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34Lh-00000009qrl-3bu2
	for ath12k@bombadil.infradead.org;
	Thu, 19 Mar 2026 03:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4b3s3EAjr8009h48cjzBmOUcZa2ExsAEz1rsedC2Zbw=; b=gTUGXiviL7kqPM1KK0CN6in8AQ
	KAsvRzvEaa/SPaPnlGm4SimoSyIzaXyWn2gOtD9zf1LPYGPxJWPa8DUUSk1pf9xENRWgczzSiZgvk
	z1jTOVdPh/UaRZwu76MpnuRQJISpLgLp0KqB79SGg8+1hjlBs4Cfa/yPUbAY46/2mySVu82sao8oF
	UuRve//JNUD1y7rE1AIz+tQJcM8W0kVPG1S7Y7xInkWHAz6TjNsokWiOO/adUJVxU/7Lfpbn3BHgW
	9CJ5xQ5+yMIblVN2VHJqIQ1naaQ7Nm25ERSy78m4mjZpXhgL5gHOF6nY7terutMYX9FcYTcMuft2j
	094m/qHg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34LI-0000000Cfiu-045r
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 03:46:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62INXiRR4024343
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 03:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4b3s3EAjr8009h48cjzBmOUcZa2ExsAEz1rsedC2Zbw=; b=Xf8pT9GjFFs40JBQ
	1uWNrrmdHG+ObQKYIuvorpoNna53OnBXqkCnHAKj+T7v0OI1rdEuxCYbcvlbP2dF
	7S0FPpto+n1WX/Izlqy6IqBxrWYmyKRIj/YaWqja+zvyvhShuCpQC2mQDqtU/zmt
	mbAW/M2BPM8m2tAUsO7cHF5NLkrYwh/9QxTMeC6BehbQTqNBoD17KaCT/eVD1sWU
	4MfrmwgtUCHXDb8mxk0Zjk5NLbXL4elYTH6lqSw9fDZV8mpjFOyqx/Eqruo4B4cU
	dPt51WcYtASbVMFMmoh1jUPhQVhSbz/sDSMnIYkhtmKqjrvdtwwAW0IjFb3MlmnG
	2KDi0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75sym0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 03:46:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a032cdd78so3142588a91.1
        for <ath12k@lists.infradead.org>; Wed, 18 Mar 2026 20:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773891993; x=1774496793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4b3s3EAjr8009h48cjzBmOUcZa2ExsAEz1rsedC2Zbw=;
        b=HUs+zWAq+NSEI+oPvqPNAd7Zu7tRzDGqsGqejEW9Z0D4TGqwjZ4TSR9nSpNaCm210D
         3NgG6BYet48u+K9VtZfdDxw86tMfA1Ce7sI+ocH3msLAfQjX3yNZwu/nKd/gpz+d7CZP
         4gVcmScaZzkVZjxNOC3NVVfD5Kdcal8RNpQTUXsPoLUt6d0T0u0sWtmGMFo+qbzU0PPi
         t5q7oT8UBB53mdK1k9ywPibhZoy5Xln8mVb8DeUj+RlUEfkQGXlS4MpEWqmMD70OZeQ6
         2RftroSwVxObbAvqZeJ97oJD9qsAcVgE7kN9/1kAZE6IHukxnOdyfAXNey6E878mUDSt
         uBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773891993; x=1774496793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4b3s3EAjr8009h48cjzBmOUcZa2ExsAEz1rsedC2Zbw=;
        b=YApdup9YHd8CK15795xT4Rd/Xl+6+UrVYvmG39wjUiD0Dz8YkdzcH5hd18r4WN/ZSF
         ftDYSSdscfV/M4NLUvfCn+N8aXp2psBUdYeQ9HBEa4yfmJyrsiOAZfpXTmzH6h0if/Bs
         FdDGeKc71rraM/PpGkgRISaAVwCyuwKSiy9cjsf9FAQGVN05yw/P17YGCh9OhMUxePl9
         16baJbTvfRux95hLe7ISa5TY1lKk65HruSTMvDB8mhx57EfC57JP0fs96vR9J+e8uUwI
         z4K6pjbUOLt21qJQFtqaMJ0vZAeWEMJZcp8LklBY+Hpfeu4kLR8f3LHoN744ihFHd0t4
         LNRg==
X-Forwarded-Encrypted: i=1; AJvYcCV39mNVD17TldCEf8rb3q/h4DT1inkpDWL2qKRIiCLsmHhgraurXNqFaZlrhUKtugU78ncbq10=@lists.infradead.org
X-Gm-Message-State: AOJu0YwG0RZhbgBuDN4wodxEaMAWa1+UbyP5QhlModc6MiROoQDDNvT8
	6WrsMEyeb/5kD0wQo/lfmmDvTguvRCnsF26JIvMIwKUaXoPMuAAlLfCHuSO967KB9Gm4BCyOJX0
	eAXbCO4i2uNQr0JIRzWngmNdy2ncEBl7vgvVALEWFAMsLjFIV5J1MpblZ/hC2Jgts
X-Gm-Gg: ATEYQzwQHpZ+5y0BPSa+hm6AIO2QSZ3YwTuGh7ncPb8AWooxicmshRyD7a/sAmg8JZO
	J1aZdVTklIGHW6c+gzDpTm0pnF/NhX/OOnXGQTIYjMrcTHWNDd1p5kIoW3aZyntKm+86Yc8DRLm
	8jgMzbsk09mZ4h+xw0uCOMgFpJg73BBs94Aqh1k0LhrYKPNPOZJUaCA47felVC+kr6nQ0jtqs5d
	kjMwKTzCaKXMltBh3LeGoTOx2oHSVkXO3hCeQVUYEWYo7R+WvyzhEKKinjxeB+gengEajVqK7Lx
	0njNnrih64TbkYMn9Uyjo+/rMbnsjajJIpsid6M68U2kedOM5J4YgqF1M0ppWKI6Xb07HBV1hxs
	Z6CtywXTeuuZxVXwEOt23IyAIu2AJKnhv3/YgxhqwFYTzmO4YJzO/s6X4JHL2IqwOxR0=
X-Received: by 2002:a05:6a20:258e:b0:39b:9644:6e99 with SMTP id adf61e73a8af0-39b99fc2baemr5217327637.43.1773891992950;
        Wed, 18 Mar 2026 20:46:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:39b:9644:6e99 with SMTP id adf61e73a8af0-39b99fc2baemr5217316637.43.1773891992438;
        Wed, 18 Mar 2026 20:46:32 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e543579sm3889526a12.16.2026.03.18.20.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 20:46:32 -0700 (PDT)
Message-ID: <8056cb5f-cdde-4890-b8cf-3b37d1c3483f@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 09:16:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: prepare REO update element only
 for primary link
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyNiBTYWx0ZWRfX7RY/EYCMcDL4
 9N/DFxqhNUGoiPmrt6iO/07qLXpyDcRBGZ+MJvEJpqqWAXRrGea/B3uJpY2iAdlW7CciN8ZczVY
 pWbHCZgFojDtwrxpTZ8iNdW68Jt1EJ0MFxTnM4a+nFL9JZi8XVA7qaEv4gKWA5YYnep5APdqClx
 VgAKBhakVhCdVJP5Fi9Awvkw7u//2jFHwztjXh8a9vO0kjNQB/yGeT/yYv+VxOGJMfsW4TjNr1d
 b1fKWNeCXXqWw/O9vC2BOCT/pFHnaWnUoDKFtCWtwGQmk67g8uwFumg7hx6yN7noh4ybNht4tGJ
 M/LVgcKO3/iihA+wRHEZprsHarJ/mZ5bzq5tacgrWp0NT0WPYmYhnn2xAenC43tDnTKYiAWqN4s
 +YdLo/zpawLENRkaTKgpM6R3HOL6uQYwbxu2D+FiUBXQ1eL6KGVz7YCjhPHBbtRarsZqqgrqD8p
 jg3tNftO3wQqStJFwKg==
X-Proofpoint-ORIG-GUID: J492N2xf6PsaR8X9uVgujmK4soUtbeEQ
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bb7199 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v1BbFoewtlT1sTZsXLUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: J492N2xf6PsaR8X9uVgujmK4soUtbeEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_034651_920871_56C98794 
X-CRM114-Status: GOOD (  14.97  )
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



On 2/10/2026 8:37 AM, Baochen Qiang wrote:
> Commit [1] introduces dp->reo_cmd_update_rx_queue_list for the purpose
> of tracking all pending REO queue flush commands. The helper
> ath12k_dp_prepare_reo_update_elem() allocates an element and populates
> it with REO queue information, then add it to the list. The element would
> be helpful during clean up stage to finally unmap/free the corresponding
> REO queue buffer.
> 
> In MLO scenarios with more than one links, for non dp_primary_link_only
> chips like WCN7850, that helper is called for each link peer. This
> results in multiple elements added to the list but all of them pointing
> to the same REO queue buffer. Consequently the same buffer gets
> unmap/freed multiple times:
> 
> BUG kmalloc-2k (Tainted: G    B   W  O       ): Object already free
> -----------------------------------------------------------------------------
> Allocated in ath12k_wifi7_dp_rx_assign_reoq+0xce/0x280 [ath12k_wifi7] age=7436 cpu=10 pid=16130
>   __kmalloc_noprof
>   ath12k_wifi7_dp_rx_assign_reoq
>   ath12k_dp_rx_peer_tid_setup
>   ath12k_dp_peer_setup
>   ath12k_mac_station_add
>   ath12k_mac_op_sta_state
>   [...]
> Freed in ath12k_dp_rx_tid_cleanup.part.0+0x25/0x40 [ath12k] age=1 cpu=27 pid=16137
>   kfree
>   ath12k_dp_rx_tid_cleanup.part.0
>   ath12k_dp_rx_reo_cmd_list_cleanup
>   ath12k_dp_cmn_device_deinit
>   ath12k_core_stop
>   ath12k_core_hw_group_cleanup
>   ath12k_pci_remove
> 
> Fix this by allowing list addition for primary link only. Note
> dp_primary_link_only chips like QCN9274 are not affected by this change,
> because that's what they were doing in the first place.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 3bf2e57e7d6c ("wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures") # [1]
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221011
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

