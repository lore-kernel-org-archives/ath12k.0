Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC5FF8FA98
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=; b=dndvR5ppB7w7VheIDLZ6iIgpjC
	0O/dCxMJokUmpjEk+J1gspsd7PEa6ndze9QvZgtLbJa7tGAGZNyYHdVVpSW3RR7R26owe2fEXdbBm
	Oe5JbMrK539R0hN00ygI/dlb+4TXHz5VG0rNxm/EoZV6GmqtI5pjkc5yHtucN0eDLnnO/HBU5900N
	xu7Z8S/wFTObMbIuVX4I9TWjsqgI+vk8BFGuRQxHa8x3bZTwBhK3ECSR+7XWa8YNcWPbvlbQ5ZUKw
	DE2h7YcN38s8R9gASB+26I0h5o9+wbjCJ3lw9krgHctD9L6ofiByz1tj2n8IT22RMXD9BlggPd/WR
	X+rv1SMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFD6J-00000008pt2-1trc;
	Tue, 21 Apr 2026 15:33:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFD6F-00000008pqs-0Z6P
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 15:33:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA2kmP1809742
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 15:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yIxlUghUBKiCc8deiyZT8qQw
	fk7BrJmVDIuLaHQJzPU=; b=RXkr/ERU2gTXlqPP0N71+8Xh9h/qx33T85Pw88jm
	lLesSNNFIySLhS74zBasK9ALQN/0eXlBAdrlZ1AJ7H9XChtCVxteuw/tj22laSlH
	lOi4iD/SIt8LG/E7a0c9HvhuJ5i+33+hoMVgRZz0PFS6IxIC0uvL8u9AQm08JC3S
	Zvck8K34cvfSJ0q3mpBA9Q/DRv30EH7WPd7KRpsj6Wl7To2BUuQ6pfjX8u/1yE0K
	Y1SDAXw7rlFkPhpmtF5g2o7uTE4+J51JD4VgLyE6TAlx7/+AefqTR/IkIoFzKmBA
	Mky6cPxvbgW0VavzE84noEXdAN1x/M5b+U6InjAldgovCg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp74xs2c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 15:33:17 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dcda136050so1095635a34.2
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776785597; x=1777390397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=;
        b=PQ/HdSpK1Q6Z91yVj7jjPAE+5yZ3fx611og0Liaa5tH8G2I6xsZCsDWNYIdaAst8Y7
         wSESJ8zOUwS+Xm4SeQxJMZKfuEBXffcIE0mEWrBZlT8PgvlE/JEKz74F9nwOjb4tv0zz
         ADF9DEIHEuGkc4sJYddqKDG6SMJlZRKpbccZND9zH/3mSqMfHNV/d3hBghduud0nNuf2
         HS4PpV0nKbrsJBxhx4M9K+R0mpqc4Uxh0lH2fjaII5vsUJDCl8drMy6nAZChwTzKQpQY
         0fI3uc19vsCdU1uCQPN6tRxhGObhz/KV5G30HrM5YABeCvK9nhJq5AA+rwnVrm79pKxv
         ilPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785597; x=1777390397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=;
        b=tDGT569h1rd4LsvFaD/J5GC10H7TOWtsXgZ8EO66krlmktlB5xgcw2+o2O1+Yizbmo
         3wLA7EdlR4c6est1cSwKEBqHqLZ/QCcahhFzuhsqlLAXxWJdeTmqAfRUYfyMW8qXqaFW
         P3VH4aBj+qjB8pQxJ6pfK8WJuRVdQJhNHxqqoTGcxn5MnSvsYmGcA+YCHjzBtelqbT+L
         lK3gue7Vv/6+GpDdRT9Ytqrv9nkEZoU2TJHzkujLbCDTcT4UaQJ7+2ovZ1IHK/4wkL9d
         8Y/Vx70EM06nZv4KRaqwflHmCoyY7iEdbIBTn7CinRNOqlriqWj+qgsUL4TPcTwJnGyx
         RTMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vOiR5or2ERtbXVv0ef/FWqfkeOhUqZ2GXVooPQPriiz/ObxNOyYykspzfShlhXxxClDugQ5M=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoe9RCD/sdFEm+wHcG3VLWKTToEssklG8d9OlUxL4ZblTSoxzu
	piYIplxNgT0uZKsWbvic6hsVNHnCB9Tv3g7H6mFV+6qyotYAOSWixu8U3QbRWIa5/+4AgTOse+k
	zqyi3Bff3GxFWorPTR6dqD7cGxOEL/58hFAMuksvw9GjJ41U4CqA7JZCRHM9oEisT3PkGt2aj
X-Gm-Gg: AeBDieugs4SdahEb5NQdrN/WAFjOE89VtgXDMrP+U1GG6X0dza6JDbRUVDnhCmc0fQi
	AlZi7Kt/4iK1p7wk4pquPxM7wrmStRDaaXtz2SzZvaRDF3mnw9GTxr4Y9Zo9ESgLUb5uyahL6LS
	b8i8AVUj8UMP2gG3M5N8AQad3GJpaII+j1kYKBjO/asnJGyanU0hatI3oYBd+Oc9kBrU/d2nph/
	ZhuUpRxdWDq+LwkPbMJCbcCSx7q5O6PWrOIIlq9KlsPjYzKw088/8SH4DrnMdGoT9ZudUMJxtbZ
	8Q724DWR4KHPKXGVORuwb+Rqf+2qFOmO5oEJkDVoAkzGhRke7O0tfx8HSc6dEgUIDVI2fxe0y2s
	1h5WbjxDpqqHLBpaZRRk9lo9/R0UE+K21bD8WybmEbCB4I35gaRTcH3DeSaEfwukgvP8qOVg6ca
	+OhouHn+jOgKraVOdGNXqxCY2ZeZ7joliHrxAtvOzwNetsBw==
X-Received: by 2002:a05:6820:55d7:20b0:67d:f88f:d853 with SMTP id 006d021491bc7-69462e2109cmr6917207eaf.6.1776785597049;
        Tue, 21 Apr 2026 08:33:17 -0700 (PDT)
X-Received: by 2002:a05:6820:55d7:20b0:67d:f88f:d853 with SMTP id 006d021491bc7-69462e2109cmr6917190eaf.6.1776785596615;
        Tue, 21 Apr 2026 08:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm3757178e87.82.2026.04.21.08.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:33:15 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:33:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260421
Message-ID: <wxnc2oczwg3hakkjxms53qbeckmy4oncp42mnqq5t7xs7lsvdc@4mmbo74zs3e2>
References: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vq8Txe2n c=1 sm=1 tr=0 ts=69e798bd cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: 8BJ0pRQVyPuI9Cf2tprKrA2JjREiVcOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NCBTYWx0ZWRfX8yexVpXsHK4n
 IBmLRHijzmiPNPhLJ3HZYHgeJH11jI6ndjSo4qXK01KILAPc/mEdR4ZeVVNs6B6noMybuFarPaW
 C/ovORe2zKpucYzxOA6Ag+rQzg8KFLzrabDbLNPd7eKAosTyS3eVBN+A3xlFca0ZyBsX3GOIdra
 05FYaHzCkYQmH0YV9TlHP2krjrz9BVahD8oA66+aOQp8HGeTTgZmY75thtTjmrXt03/5uXqOOrJ
 bgAX474QrOV9cFViYAR8ZVqFbbaarMJtlnrr18OYApbLVXbBTSEucHxJlOrkPC0CnPCga6GNbEu
 FeCCE574jCdo6BGRgLtoD2xSSvNAhTKMXp1YM+KsUZLDG9T6NTVhkMZHsFrAuS2XEbh1ZA3QTC3
 +XgFbKyW+YqMLT6dC1n2ciN0LIzg8YZpL9QXrs6Iqbuf0TZtrpEPM6pyGE24SP/7XJ1myL/xVGA
 OhqJR5xEjuzwpC0tssw==
X-Proofpoint-ORIG-GUID: 8BJ0pRQVyPuI9Cf2tprKrA2JjREiVcOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_083319_340824_C47EC776 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, Apr 21, 2026 at 07:36:08AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> For ath12k, add the initial firmware and board files for IPQ5424 and QCC2072.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1010

> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> ---

-- 
With best wishes
Dmitry

