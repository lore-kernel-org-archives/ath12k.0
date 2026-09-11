Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7C6C88E53
	for <ath12k@archiver.kernel.org>; Fri, 11 Sep 2026 20:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2f1tyPzUGJPWgoXHlJFI5ih3kMGH8+HrYXagtLin9c=; b=L4vgrm+a37yWRqeJTKtzZIhzHd
	UXvSXX5B+gG77LozPgKMilWmMNeskuAyWLrABL5Q0ZXxerKqPLYcVhiO2EdpBfJuq7BMmhwfI9e5T
	8OPT68O+xFo11s6H3UwVk0Jh4ytT2Nc8TGF4tEZqlcm9M6r8ho/x1IkgS/plyTgsHIH8tlBwOXs6B
	8Oe2+1gaO+pzIrca3GPIYHhXYWCI8iLISKiS0afCdeR+Xk15Kyc80CKej00RRG2BaPTGk0Xkhk5ak
	F3J76ETQHXD9KqRNJiqkBSy9C/paW0soFpraXW1Wa4fN8I1bb3+W8RJ1nRbuksn2YhLsp7kK+gRzu
	FALSwMoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57zU-000000006rF-1IX8;
	Fri, 11 Sep 2026 20:36:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57zP-000000006qB-0Ce1
	for ath12k@lists.infradead.org;
	Fri, 11 Sep 2026 20:36:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWBDS1738673
	for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 20:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2f1tyPzUGJPWgoXHlJFI5ih3kMGH8+HrYXagtLin9c=; b=MIl3+R9x4hdboPZU
	GpFHWznV/UTHnFtP7HroGlPgBWhQ3Dk7vRpJnWL98rC7xyvAKdf+cKKHTpug7hT3
	7espi+uVOvvtuLWpMRMLBA1T6DustWR9cpRmrIfamLI/BDL4SCxroMNbKa0kovrB
	f2vJsSoLqynl1tZhuVZ8N14oN5XmWi0QBlkaSssmYOpQWsnKO5pwD7iZj0xAheNi
	6CcP+XunN6g7xY+0B7AqF+EPkrLnT2fNk21UuwN4SCEbaWl22elUo9itSknsqcWn
	6eP2rD+NgrYvfniqs0ASWVC8B4S1bEV+83T2tVkIMBes3/5E+EQZvMPmN2GqYQ67
	kBUjHw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmp0m0nvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 20:36:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso2178934a12.1
        for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 13:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789159010; x=1789763810; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B2f1tyPzUGJPWgoXHlJFI5ih3kMGH8+HrYXagtLin9c=;
        b=Brfbgf7i5TD+h+kAH95/2wD8sdCdbWlQ+equKCHnYmDX6GxoU3aDZ9cf20j4C1+xsY
         Xnri1wH7qt2hJvoC00QktIkCntoy0ZWihmk774IFohgSBQsxNiXwepCF/51cx7ae4K+p
         C+vnSI2Vh2MlOM7zCSKEbMh9CEfsPYf6x4Lo1huUywntNqglxHZUU9RFTw+Ja7fsuKJl
         FcrhnfeIv36mHwXgaXY0Plibq719zRRTQziKw1snL6ghAA6YyglOnNKJ/Hh5O5r4Ct/p
         UDXnMtf8FhWaA+H2i4joEp7wSAdwPMWlzQUgOWd8mhUwCLgAP4w/OoOgjf0ssbM0f06g
         3g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789159010; x=1789763810;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2f1tyPzUGJPWgoXHlJFI5ih3kMGH8+HrYXagtLin9c=;
        b=FYP78rgCzll8FxbmqWtwutJ7MPfMWOHiRakegFqtMUlMA6yQmu8LcFcrd2foHTpi9c
         i8d7+qVx4SVES8CQv1cBMEcjb7lzrTE6qtEEv01eDNDAide9V7d0EPxryIUNygZUjktd
         E8LmhVGUVfuBY63N+13qUhqSA/H8Sxa6cCrXdEyl0RwmNSsRv/jlm8eIw3Y08GTolWdT
         l6JUTJqwr46OKYGT2/O0rs46r0/Y5H2xejrCH8meNyvPN4DGZgPwHApwWaWbkAtaqAxz
         gDqG+hb/VLrumKOiZZSHmSnEfGw2ZVVJIc76xIsG/UGJGfwDc60x3ESUzdOeL6xlcn9C
         5IaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvVQ4xyu7Fy9UHH34Aq9nKfgAhPgdtOREENj2RExE/f4QO7O+PDvPTc8tCq3EdESkmrGFtkw0=@lists.infradead.org
X-Gm-Message-State: AFuF++npTc0EEW9TcIp6os6hIkAZb8od33kgt4OtR68s+EeQcgQiJfeZ
	UPo34NsUlbIOBca0P6MogKB5PQhzS9ZLtz+yQxSWqV7ZPIrg7CGKlVSKunydtUtZIqYJFxxukPI
	YbGwDvmi1/upNyRjV2JB3eBFr68gob1aW1/wwqI8VNf5w+HBBwo3EjzpGWqRZZ8U4
X-Gm-Gg: AYBFou0uvci0+IzXYU6vByK8REzCCjLszupbAmVwcRgYN83LmlzJf/R5ay5gaoH7d0M
	kkVuDzylLn8p+r8io+onbAjdMVOryB2bJqzkNJ363nFF276GmLGOfT70w63VdfIFybTMG3FB0hS
	BNDLxq8no8+NH9Zlv+gSC2Ve7rmQ5tqmQYa0vDzRgu35Jrj/0AMIQ/Hj45JgX84y/xS0N+5wESm
	N2iV41DVPKtq7t2uHz9dW5D8eNv7wVvgICuAWPdQZeLunTsPIVjj+1MNQbhe1t8mrTdGgGqBOzr
	M0i30Bq1qhQh2HR+gPastIvKkYqrAeFVcaat2kLXGTYVLsgBTtx8zecLjj3a0Qby8XL30sHzakb
	aP6q14c7E5480Iv+fulWNXlpD/cx+2FjdNpjs6ZVHuPb1i8L18l+vrh00nBkR
X-Received: by 2002:a05:6a20:9147:b0:3d3:ae50:97cd with SMTP id adf61e73a8af0-3daed880077mr9742068637.26.1789159009580;
        Fri, 11 Sep 2026 13:36:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:9147:b0:3d3:ae50:97cd with SMTP id adf61e73a8af0-3daed880077mr9742025637.26.1789159008965;
        Fri, 11 Sep 2026 13:36:48 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm8535455eec.14.2026.09.11.13.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 13:36:48 -0700 (PDT)
Message-ID: <dded65dd-56df-4637-b3f5-c244651435a6@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 13:36:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 ath-current] wifi: ath12k: convert scan timeout to
 wiphy delayed work
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Jianhao Xu <jianhao.xu@seu.edu.cn>, stable@vger.kernel.org
References: <20260717025602.262916-1-runyu.xiao@seu.edu.cn>
 <49600545-3e13-452c-8940-c3e775ac3856@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <49600545-3e13-452c-8940-c3e775ac3856@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI5MSBTYWx0ZWRfX6NEqlEP8gMWs
 bGsa26+2NtC/YXSnZikitVhlmfmGiWSrDgzhQM7FXL5CMW3aau5W/P7HJZw5BoQiwzSUFalh78C
 o6y7WPZteaPgXgzAR1R5Wxpl9BbV1Vo=
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6aa46662 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ucu4zBzE-dK3vCHSYFkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: quB3jyS6oChAGFeOJeMV8w9S0sldpJ88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI5MSBTYWx0ZWRfXyTYFAsnEVbml
 FwofnGmQMmCsstq6obuhBr/V3Gg8ECrIcn9Mqus5o3H/JvNFZBnutw7v2TnYiNingHl2zlBxLMY
 44ECx8tZGdEJZnemEMaKi/GIXuSpewkBPBm/kAvhVAHpqhlLkvvexEy4Bxp6S94nk0Ih+l8TeMi
 Oj94nTYgilHszUWuOhCmybp0SGGyXZlDxrNIECKaICCX1cBoHfMQZDMdZCnqDmy0MORVRXtsgj+
 b02CgOqsntpIY0XSX6XkdNWUrA0uuzC1ez84/vzop5LgHC4QuL6DksrGt3rLWFgrBLeEn6Qf7td
 MS/1wjItnCPJgvMCbHuaWBXLv8KnqBx8chLNtTK81n2F6Mqg0kGRvtRJUyqO423RrGEXMsZS2jO
 OxhZR3oTWX2qnkuwRVIGs+KLwdWNuFYRwv4s6QPxH8sKy9XDojfKBMlIU0KqGUyQzX1ptEDP3rD
 hZYmL19iOmNkNCXiB1w==
X-Proofpoint-ORIG-GUID: quB3jyS6oChAGFeOJeMV8w9S0sldpJ88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110291
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_133651_187191_05DA072D 
X-CRM114-Status: GOOD (  30.40  )
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

On 7/17/2026 7:40 AM, Jeff Johnson wrote:
> On 7/16/2026 7:56 PM, Runyu Xiao wrote:
>> ath12k_mac_op_stop() is called with the wiphy mutex held and calls
>> ath12k_mac_stop(), which cancels ar->scan.timeout. The timeout worker
> 
> you are missing a very important detail, namely it is a synchronous cancel
> 
>> also takes the wiphy mutex before aborting the scan, so synchronously
>> cancelling it from the stop path can deadlock if the worker has started
>> and is waiting for the same mutex.
>>
>> Do not drop the wiphy mutex inside the mac80211 stop callback. Convert
> 
> What does this mean? Where are we currently dropping the wiphy mutex?
> 
> You should describe the patch in terms of the current code, not in terms of
> any prior versions of your patch.
> 
>> ar->scan.timeout to wiphy_delayed_work instead, so the timeout callback
>> runs in wiphy work context with the wiphy mutex held. This matches the
>> locking model used by the scan vdev cleanup work and lets stop/cancel
>> paths use wiphy_delayed_work_cancel() while they already hold the wiphy
>> mutex.
>>
>> The old scan-finish path could cancel the delayed work directly from WMI
> 
> what is "old"? There is the current code and the new proposed code.
> 
>> event context. With wiphy_delayed_work that cancellation must happen from
>> wiphy context, so keep it in scan.vdev_clean_wk. Mark scans whose cleanup
>> work has been queued so a timeout work item that was already queued before
>> cleanup runs does not abort a scan that is already finishing.
> 
> My AI review agent thinks this logic is unnecessary, but I haven't looked at
> this in detail.
> 
> "summary": "finish_queued flag is a redundant substitute for
> wiphy_delayed_work_cancel: __ath12k_mac_scan_finish is always called under
> wiphy lock, making direct cancellation safe",
> 
> "failure_scenario": "Every caller of __ath12k_mac_scan_finish holds the wiphy
> lock (directly or via wiphy_work dispatch), so wiphy_delayed_work_cancel could
> be called there directly — as the old cancel_delayed_work was. The new
> finish_queued flag instead defers suppression to the timeout work itself.
> Since ath12k_scan_abort already has an explicit ATH12K_SCAN_IDLE bail-out path
> (line 5232) with a comment covering the timeout-vs-completion race, the
> finish_queued guard in ath12k_scan_timeout_work provides no additional safety.
> The cost is 8 reset sites (lines 5337, 5624, 5681, 5775, 10971, 13969, 14012,
> 15061) where a future error path that forgets the reset leaves
> finish_queued=true, silently suppressing the next legitimate timeout abort and
> leaving the driver wedged in SCAN_RUNNING with no recovery."

You never responded to my response. However, since this seems to be a
legitimate issue I did a little more research and now see why the
finish_queued flag is needed. A better commit text should explain that since
the current commit text is confusing

I propose something like the following. Yes it is AI-assisted, but IMO it does
a good job of describing both the existing problem and the reason the new flag
is needed in the modified version.


ath12k_mac_op_stop() is called with the wiphy mutex held and calls
ath12k_mac_stop(), which synchronously cancels ar->scan.timeout via
cancel_delayed_work_sync(). The timeout worker takes the wiphy mutex
before aborting the scan, so if the worker has already started and is
waiting for that mutex, the stop path blocks indefinitely: stop holds
the wiphy mutex waiting for the worker to finish, and the worker waits
for the wiphy mutex to proceed.

In order to avoid this deadlock, convert ar->scan.timeout from a
plain delayed_work to a wiphy_delayed_work. The timeout callback then
runs in wiphy work context with the wiphy mutex already held,
matching the locking model used by ar->scan.vdev_clean_wk. Stop and
cancel paths can use wiphy_delayed_work_cancel() while holding the
mutex, which removes the _sync wait that caused the deadlock.

There is, however, one additional issue with the scan complete path.
wiphy_delayed_work_cancel() requires the wiphy mutex, but
__ath12k_mac_scan_finish() is called from WMI event handlers under
data_lock only, without the wiphy mutex. The existing code can call
cancel_delayed_work() there directly, but that is no longer valid when
using wiphy_delayed_work. Instead, set a finish_queued flag and queue
vdev_clean_wk, which runs under the wiphy mutex and performs the
cancel. Add a check in the timeout worker so that if it was already
queued before finish_queued was set, it exits without aborting a scan
that is already finishing.

/jeff

