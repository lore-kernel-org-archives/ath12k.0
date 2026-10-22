Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA66606A31A
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qrlLoytk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoNqwJo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVzmHwaT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=; b=qrlLoytk+nrKcsrft/QV3L4TWH
	9nVXhlWQ6llW6Y3ETFCTQqe4SJ23seF9xwhQx71H6EhwLg/Ltf7Qpy/rsqc06jLmp+QLqhk62bvxL
	zXyfc6co9Mc7kPYPdTlpJUzs8fGuzWUZsE9poV7FwhBWXNyOzIs+HTnLa2purnsf2PFm9NMIIFuh6
	4RTYgGfIkDKgB6LZdixjKewPrEOHOz3X2TofAGT2luBh2TIwpVKCp8bTfoPgZ9zBFdRXFiN/ghBln
	u/ikPvMv65BaNppT9BvPGC+zeQz9FZ0/nDgGyj1VNf0X86cJeJ6e7wani4jSnb5D9bGPYtxhAMsp6
	UiUV39VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy7w-0000000Empt-0WLS;
	Thu, 22 Oct 2026 19:07:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy7s-0000000Emob-3gIU
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 19:06:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHt9bU060118
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 19:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WP1RCtA53459OEDtUvLHcE9m
	HWBQjuh3IU+rXf+WXSk=; b=BIoNqwJo+9cHw/AmG/yoh2Nuki7TD+lTLAXEY8DU
	yqVhor774k3lFGuWtN2mJZkBFd1iDm09qQlX3EFldoIGWgUvY7vBvCXtLil2PWn5
	Wjk5LYrhD+59pwSlKUNqRz5FF1UPTbLZuYJVEL7RrZjPEisHOZW8TY2ems8ZxAVc
	Z9YkyY7YQxybQG1DUqAViNSM9Nb8dUMid2Z5p3LSKZmMZ+/cqqLkXEdcKvYl+kcf
	egrlF4OqlYtMf0XUl2CkZ6aSmMG8Tz5/iKLjn5ZXm2/7mxwn0cznuuWJDkeQy1sT
	Pj55wKPqvU432hIrIXn9ZZj+onlLGXmXzUT+mQd/PM2EYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahrjyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 19:06:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso17811885a.3
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792696015; x=1793300815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
        b=dVzmHwaT3mMV+ufp/Zn1syTvOYfM7O4tlGiYbbyegl/EusyX16PRek7rQQWH5qO9oq
         vKMzOKNCXMqRUv536tMri/67MUw+QWdK0iYRFVpgKxBvJpMyrXR3xKO/1wSgW0qR1/hp
         uTCLCvXD2SB6/wf83tPTjDKsL0W+79LN/nl72vuByAVBh+dv1+H70ghxKUs5Lpl8vxnF
         9KC2dUijpFCkFlPiNyAMKTrBm8s1G9Uh2gSi/TZeli19Bv7D8VVqUPTByjEOmWckP1aT
         tS6vptXQFFvQHdv7fyIGR9c+BzkmsOFZTzzXuibGyrOXO1I5jr8PBHtmwejBr/hT0oFV
         GPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696015; x=1793300815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
        b=YMsJ5LMAm4ACYBkuS2X9TR5WkGXmtNPA0cXL9XCQTwbNszBq3m3gBOa0Wj7ncGxSSr
         yNzvh0/Cu0scXdYFZFAF1dS3+yB5KhRLfpykkE7hwdmXz0VMMizNs0AKNnqZoP6wkuUq
         zihvpY/kaGp+3Es3Rib0SfEe30SlS0+WA4jICzC+Tu+OpMclxXFu/mUqNrXXobDMftkR
         TskGNUhDUNnHa73T9pepItrgQvUTitC9nBusYmhrTQPJlc6WXxU5vhz7q300qlZvwATP
         H8mtp/wxrCN7uOrZR3L7/yx4S7l5VFa3CGRi8IcvfTA5w6Gi0sAG3mUaDbLrhgbVi5fz
         VO1A==
X-Forwarded-Encrypted: i=1; AKwUvBx4syTK+VXZ302aPEp+jHfqcWcm0Zw9esJyCLuRQJ8BX+nQaoDsUbS7UHIxlZdNJrYI+4IN+yM=@lists.infradead.org
X-Gm-Message-State: AFq9FYLwYUQNjH6vGVFQz8A5CaWl+g+OkXnTjMBRNbzHW8VVvmnauUfS
	kq7JLjEzpQfYbFlrRRJR/j/njfqrqk8SD1+euSunACGgjJWMrRyeqxJtvigumevmmd7/d+MFJ40
	1aRYtpmufk60VGYUELWFcRLyTJtpTne1bUDuuHxb/ljMDTTyvC/r6nwfofCKG7U6c
X-Gm-Gg: AYBFou0derbKAfRVG1olvL8azBm/1fR7OdsmnxRNvSmljvDdVoHBbTHlShekMieiMWx
	f2X8QvmZevZXFrIAEtd9C4ykfCekAhGtmUpJIjd5aA41lhRp/9FocPx2F3BRtxM3uYLtT0I/J+G
	JzaMT9IpTNhpAsdrtPvH6zJcClFCNpwYNt01SFzCGlLGYf6TIpMjjUzOn4ox/RhKtioqAH01nt8
	cTwDHeUJQY0QOhAKPpHxHY8OhOYGxtRPz8hiUdibwFZlXtlY8DzRMzXKVMFOVhZdUvSF4K2P2C/
	VnRonUjIepiYXudo2Fq+GtQWTWZKAG0wObsbnVWKV9aeULruvNannp+Am14ZPARmuk3DEcZZQbs
	jOuMs1sSyvWnC0cYisJAFNjA84pAjsWWzLigaCL7GpjN2TU6dQROak3jA+mTevk7OHtvKEd2RkJ
	qHaadJb+BQhuDw
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr64323785a.39.1792696014948;
        Thu, 22 Oct 2026 12:06:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr64317785a.39.1792696014437;
        Thu, 22 Oct 2026 12:06:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02a31acsm14215e87.81.2026.10.22.12.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:06:53 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261022
Message-ID: <vicvgdgj3hc72mj7q2bp6mdskwajufdexr3gz63v2ixrmua36b@ojvj3wo2j4q4>
References: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfX/GVAZOV6jvWs
 YOtkJVbmFthe6OSX0GzKCTTK+MiW61D0W+ypCXe5KgEaJzY6SJrlRgTn0m1aU5aHg5BjFGFDsiC
 nE771FHU4gr8/pBaWw5+OU1RfVdr3q0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfX4wkK/yt1TM27
 /lpOMTuNB9ejbcBdu1qvYRpwGvCnIpywVjv3jrWaiSCY+G64DZeNTSqi0xmRrLxDiPz93zi1Xvp
 gEMbjdRD2+od9OQjpWTCs4On+lazCuJAjO9a1Iuqjzbqxk2h+JqkRaL+cZjY1mue0MUK4xd4AHA
 jKi80jjc9/qeEKIwwr821dsgBBj1El3YCCVN5AMp6iuqVL37fscjsEr1dPJ8piowjc31RLa8he0
 d6kENBJUpq253T4L+5IwhPFyzRvk2UVY263LiyWzb9MrPHZXvR2o+HRQE0HXTaCCy0CwFPGNQQU
 yLWmdZ/N2aNKIt1jIr24mi+6iVB5cThmwDNZhfR54Cv/heIouzdKZszouC7BbeVEpbAdAzXHJdd
 Qk+DH1rLuNoKMWN46IthhSmNoDyFRnlrCn1IIUuyds+nGfF3L7oN8EtwKG3SqCqUtEHGv4d8lUm
 Va+jbi7ksDK1RamEYEA==
X-Proofpoint-GUID: bNm8d6oyio23iyrG6_auiLLvlHwSoFWC
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6ada5ecf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=u3i0YCyx4Cyti68HAGEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bNm8d6oyio23iyrG6_auiLLvlHwSoFWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_120657_087236_0450C51E 
X-CRM114-Status: GOOD (  13.62  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:50:15AM -0700, Jeff Johnson wrote:
> Hi,
> Here's an updated pull request for ath10k, ath11k and ath12k firmware.
> This supersedes the request for ath-20261021.
> 
> There are no changes for ath11k or ath12k.
> 
> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1319


-- 
With best wishes
Dmitry

