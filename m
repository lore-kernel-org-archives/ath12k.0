Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4AECF58D4
	for <ath12k@archiver.kernel.org>; Wed, 19 Nov 2025 19:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcsqynF3Bp8NgG/vPKyY0OFUD80XZUlirrGBzWaYS3A=; b=cd3X5UynZCISE7DC+gNpaGAGqa
	JGXUBBWQ7qwcascu0LNJItg5CGEDnz6GRkmpXAhTNw37hALnRXeYLzEjgjTLcT4DB79XQOnDCvtQ3
	KNgs9BIUaZ9w2QPHHZ3SxnrLIsJn9PigB4hqzPxYXyzUW8Fl9/gFn35+UjQOY3xVRWmoE9iFvcvJK
	bOScAVnftXqvmZRiacUDDCK4i6b7QCTZ0Lh4F7qsOWKPTT2goQiNoEBI0hGdY34Aeh3cf7bjtF8Wz
	sSQH5uihspVcWn3orc7LY3LQQx9h0slaUC3pFg+YBC/SqBr1mH0+gSUaK2C4yxkOdKZvFI31XlBGz
	OK948LUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoEw-00000005DHo-1lM0;
	Wed, 19 Nov 2025 19:53:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoEu-00000005DGw-2bQD
	for ath12k@lists.infradead.org;
	Wed, 19 Nov 2025 19:53:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJGFerl1970160
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 19:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcsqynF3Bp8NgG/vPKyY0OFUD80XZUlirrGBzWaYS3A=; b=C1DbucWP4OfUp9Jk
	RODNCO5rPbr70mTDQG4AD3gTKWrZzOiT6OQu4rrA0SEMS7/TkSsk4OgcYsV1y8+k
	8v1xRSrympAixGQCtY+rR0zr+q0QywMGPHEbCnNcHdh/Oin+qqHFzzdlqzKO340u
	XmFFWUbYsuKrIcvv9EPN25WmHkm4l2hUq0LrR6IvMVBkoPcehN3zrCF3dDFs27e/
	UVPHN/CHACqq+pmVMbP76NDWIf8aNtMNi/X4qtNLPwQGdQVY76bbhoAKaVyrlwIi
	zpYThpk50TikKBiBwfWisU4HWpafxhhy97wr/S/X/9zRYN6kpOw99lTNSBTVQlTA
	gkcmSw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t0nht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 19:53:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343e262230eso36025a91.2
        for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 11:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763581995; x=1764186795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcsqynF3Bp8NgG/vPKyY0OFUD80XZUlirrGBzWaYS3A=;
        b=hSW5FR929c99Fn3IiYrKlInkA9LGcfPKwoclUjPuk6T6S1bhHOi3dB3/2vNZXSpetJ
         NsaGyaxAy6WGAnQyQfPVLUfBCx9Tja/c+ji4Y98PnsSFGgQdCDksRBBXJ3Cc2Qevm25f
         sG98N0DGJhnvtBYgcYEy1xJneHOH730SoWEJYj9GBPTybYAmgDOw9a+7tZjO67K9DZs8
         NfZ9xuCnrVlWLzucWxIx20wkfJy/6Gx8oR+OH0lIJ2n3OjPz0q0a74TjfJHY4MUvzUGT
         W/KvykyJMHbV3tr3fT9jbj5FKttrt4NxkyUAAciwLc815eH0p1OEHx1sZ9oAco8arczB
         KfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581995; x=1764186795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hcsqynF3Bp8NgG/vPKyY0OFUD80XZUlirrGBzWaYS3A=;
        b=hAyQCTH68osLEEySKlRZOGzNcik1Ic0cogCGO5ZCyMSzVVEnFNvb+4JDAPbocKYLLJ
         kPVEVAtDtb1pJS5IxPnJZSMhTbI+nAF9KhDme4mMCnqoDoAQnPyuFMQSLwEeA8w8UZ5Y
         wC1Plq77eFZaCS5Ik0PXM82XUEOK8GF78DxbLLBKsyygP+sWQ12wg+9rn4kdCU1KsfEO
         l5o1wUEdsFQOxcMPKrzODqosBTKIrKcJa6btdFEBCb6hoohDt4qTvK+24V9Mdl3RlyfV
         XXMGKXQxL3tkLLjzgG0KdsJU3wUMFuE72CTgJriNWcPjmcShcJVCeUKdapM7yWGicQbe
         gJAw==
X-Forwarded-Encrypted: i=1; AJvYcCUEWIWKVuywdXlLcZAjnmlPSY9n63Y7daqMGv1SQz9SmtuUZAvXVlrfgQvwrSCZjYYK6tBhOys=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqkKahSkfFqkPfGwu4Iu5DHXU2k4HCLUhiSjKyRGoQK+i9/iah
	QTI5RnBKARFQFVjtq2bmMweqhcd4wq34J30lPXYvdCKbdW2+XtnPC2dL9tOeSQmxPn1e+qkAdXc
	79qGR0jLnUqIGseosPRGPpVPNTBc8dteu2FwJaTL5yZfdKYWsARTBMRVTN5peAigDN3YpLv+l
X-Gm-Gg: ASbGncvSg/nFmcHMI4/xuBeuVl3MmpaOB7pwSDLry4Llh2X6w6k9r9bsy4aDqt7NwfH
	aflq/9RdB5jEbSNQKoAIJQDisXoclek7bS4tyu0er7RvIKRVXpCyPFMXIGdXxvFbSJTo+qsaXBI
	88586YLhyzKNf9ddaOMGA0yQ964rCqsu8LU4677dEmCnLxY88fePo5GHvxZUF2ydjv+QFfzOH9T
	x92KiNLT9cszkmC0P0gQN7l940+VQa4UY6xzjv54XRCMZVw75uNt4biVGseuTwDxwVxYrThtS+V
	GLDqKt+MD+0GCsNpwuNvJ+XuKNp7YUkIR/rvMqDIT7xqUmS7c/tESfAPbejuboHfWV0nqb6JXf7
	J8IIdXkb49mkaZvfHyHUKv13bsC1nr+7lrIk/S6FXk8QdBA==
X-Received: by 2002:a17:90b:2b50:b0:340:d511:e164 with SMTP id 98e67ed59e1d1-34727d5681fmr320461a91.19.1763581995396;
        Wed, 19 Nov 2025 11:53:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqD0DgRfHn8ijfztlr1eLiOvaKkja28SN+BYIN8BVb8OVjnufIbt7/EDUPxlqbExnykc86hw==
X-Received: by 2002:a17:90b:2b50:b0:340:d511:e164 with SMTP id 98e67ed59e1d1-34727d5681fmr320431a91.19.1763581994841;
        Wed, 19 Nov 2025 11:53:14 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b0512211sm2646721a91.13.2025.11.19.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:53:14 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20251119-ath12k-ng-sleep-in-atomic-v1-1-5d1a726597db@oss.qualcomm.com>
References: <20251119-ath12k-ng-sleep-in-atomic-v1-1-5d1a726597db@oss.qualcomm.com>
Subject: Re: [PATCH ath12k-ng] wifi: ath12k: move firmware stats request
 outside of atomic context
Message-Id: <176358199425.3002662.13560863807983005117.b4-ty@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 11:53:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691e202c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OAyIG4kq6eV51QKt1ZkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Nx_71XzpUKxVn0u9NkrFQStcnfNdB0b-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE1NiBTYWx0ZWRfX3/SgzQ5I9MjI
 vf8wshjthfSZAn9/+dWR5Qw3B6DWWpW016312g2iKsogsZXWEAjf1KiysD+L2GJ1WDtotELT/97
 e8wVJeiTTJY2JInCwRyWw/uO/FosHlQErf0xERxmviM64GkVb3wHGetMrHY9GR+jrBSEUYe/rUl
 P+qEb5fS15GcSUISfts8kK/rExwRr8OQHvPu08bJlhnh+IWJ09p0b1lQFcFk0IEG1hU1rdtM4Qq
 5FjghDqsCcwfuqAFV7G3GrzyIjzkeFWZeMDxtQVjv/HQdWHgpBR7femChQJNvp8KGYV31p9l8sC
 SKrIgCx+ESyELepvO6k/CBnfkPi8NG2MVN/VY0I9qZ6l2E279DwH9Dx5YM8x5UE3L856AGIALRM
 lqvvd0loRwu8B/AcjMWJ/BZsbUGHqg==
X-Proofpoint-ORIG-GUID: Nx_71XzpUKxVn0u9NkrFQStcnfNdB0b-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_115316_665091_A0995F20 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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


On Wed, 19 Nov 2025 10:24:47 +0800, Baochen Qiang wrote:
> In ath12k_mac_op_link_sta_statistics(), the atomic context scope
> introduced by dp_lock also covers firmware stats request. Since that
> request could block, below issue is hit:
> 
> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:575
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 6866, name: iw
> preempt_count: 201, expected: 0
> RCU nest depth: 0, expected: 0
> 3 locks held by iw/6866:
>  #0:[...]
>  #1:[...]
>  #2: ffff9748f43230c8 (&dp->dp_lock){+.-.}-{3:3}, at:
> ath12k_mac_op_link_sta_statistics+0xc6/0x380 [ath12k]
> Preemption disabled at:
> [<ffffffffc0349656>] ath12k_mac_op_link_sta_statistics+0xc6/0x380 [ath12k]
> Call Trace:
>  <TASK>
>  show_stack
>  dump_stack_lvl
>  dump_stack
>  __might_resched.cold
>  __might_sleep
>  __mutex_lock
>  mutex_lock_nested
>  ath12k_mac_get_fw_stats
>  ath12k_mac_op_link_sta_statistics
>  </TASK>
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: move firmware stats request outside of atomic context
      commit: a1e19289932aeef26085feb97597d624da6302ab

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


