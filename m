Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81AC88E4D
	for <ath12k@archiver.kernel.org>; Fri, 11 Sep 2026 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA4Kl0KLnzcJOt9vayKyZzMGbRlqf8uEKgvEQ7zEOY4=; b=ydqWs4jikbqLtQDLpJZvaiLuDL
	iBSUs3EzOSSSWWUBnLrs0HBVDh39ioDvOvfSpzODZsFI1OWqDzLAv2FcKu5eT/juabORUJ4a2bVd6
	hBVJFz/l4JfSdJVl0fpaI+3vUvFV29xeDvXL9DIVDcEUNN1DvUeCRscO8CcZZLpjg3MemWJlNM2tD
	8yu3ckY7WdGFetyDH9MyetJQ/utimesdkkvwHrX+gfaHonV+R08zCNWLn37h79OHjC3WNH+DLnqSl
	TVt/JxOA8wfRyeN/iwtOYCJ2DAKylWzAHpE9pMU/MZIOOMOK1VWKF3ORpftqYdB3TsntBPeUqT21F
	dvKFeOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56iO-0000000HW3R-2uqQ;
	Fri, 11 Sep 2026 19:15:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56iJ-0000000HW2N-2sYR
	for ath12k@lists.infradead.org;
	Fri, 11 Sep 2026 19:15:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWVZ8488059
	for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 19:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XA4Kl0KLnzcJOt9vayKyZzMGbRlqf8uEKgvEQ7zEOY4=; b=Mq2EaacaVAgjVX0e
	3N8B2iHucKabcLOOEc02aUGBnNV1A7FsZjlojV+zwiV62S0nJB50RHkgs4H7Mouf
	jxR1Kdr0rE8AaO3AmU0CgCnGFzgNpJkUL/ugujL2vccMZ00PuHYh3c7IqldvdpAP
	ynDMWe3JmtbC/oxvCR+MN2m7uHqKznVzdB/RsXqbBo6CJKmBPUd1noI5I51K3TmK
	ShkkAr06YPlO0GE3JaY4A58G2ThIv6fSyyQDv7e5v2d5Uip9sUFZdM1JoOWPo146
	UPVT5a6IA2VpVthw8tSq+HpaT0FP6OLuvdgRBUXbxIoBEAdSEq5sOxVqMNr9JvgX
	P+IDRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm1e8y6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 19:15:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1216523a12.1
        for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789154105; x=1789758905; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XA4Kl0KLnzcJOt9vayKyZzMGbRlqf8uEKgvEQ7zEOY4=;
        b=bP8wv0eyI7sHQA7WESaK1ccDqbEzFgbC6p55dkgJNK6EyUMO1/G/UBKQEudBFitRus
         LS3kCnNPUqHbj/GlvJnTicAxHmvq+pJjVE0B15r7dByn1xFihg0jIWOuOxve5XPpkYtE
         ldmA439x3nvW5fYfENLFPixwqYPVo6YB74LsIos0isv8/zCsKAQofCrI1X0+WVJtsDON
         1kk5vYz/oFprijVBCidRZU4bQQWGa95d47oKsRSBIhMUDnJaI9SD09rEIfoctlWh+4bS
         tKCovXwZ3QnT7HrVWofj4yyg2ZV+k4/2cLF9eH1CP4oecONEcexT1gbnZur0LvhF0LhD
         +qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154105; x=1789758905;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA4Kl0KLnzcJOt9vayKyZzMGbRlqf8uEKgvEQ7zEOY4=;
        b=GCGZVofYAO4yUA7u3p3L9wRjeNLEjs5NJJQtx6VZ7uDTr1jATAU7SbjpjtaAKLmnsR
         Jq6VwbBnhyYvVT4P4yD78sVk1O0Y/sSvzSwMm+1AsfN10m9z25j42LrCfD3rv9P5o2yS
         pnYXMaTjCRVhMRdqObNU8leBUB55rK6/Vy5AxwRzMmxz0Gt83o7iGQBXMlYidibbzYxz
         /cgyD2DSQHFWXgDwPxhmnc3WnL1AWsirx3jc5dh6Fu2EpfedVo0aY7I2qDwwbXdANZcm
         3CykiiS1G+4WR5LVyJnAuGEHuJwhLl8iw2AxL7Pibby3nScnFvXPYTLqL3/B1rxvRGt5
         SC5A==
X-Forwarded-Encrypted: i=1; AKwUvBx9VSBBQWk5W2+VQUr8gf7nCdsbCoZuMuonUTN57azZpShFkhEDuC4TuObjn8rbJ1zVRiBjtOE=@lists.infradead.org
X-Gm-Message-State: AFuF++kKXndRk1+TANk/6+UHkQKf2/NrZTZ0X2FcKjUnkE04tAv13Tgo
	EGYt/Vru/pgY/4UzgjJxi3StwSXSte/PY9ZkFmGA9WvVr6rdjwr6RCI7TanvCCQgSGq3I90H5CA
	b0bFHOLlbeoZdxVmmNevebVMpdxuLfvczhRSB+V3P0BI+aRUW3wsbcMAEkqAQ9BYijqpL37Y0
X-Gm-Gg: AYBFou3hnWXR3ghVdoC1EhCrKhk4psGNPTvhCyjpGfH/GVp2R4iWoyYLAd1CGZKND6b
	isInFsO+C6gszwe6KOR4ERj5/ohdmL78aOzryhkOFBpVVl8zt5VKgXvi+eecBxbB5TQgsgbM4f2
	aW1i3u48F6nmzTPWhTa5WU3mY7KyxUKsSyAqFJu11K8vFg9/lm9eIJRTq2I3WUFXteGOnb2w4jr
	2D7jY6nl40zlIHF4f2pSIdJx4lIJRvLbxOaJ767A5QR2TDprxtEZhUfNuO2HZp2/50eN9JjhAMr
	7A9C0HDkd1PrdxoM6rPf2nGpBW3Q1Znz+C0iEO9r6sd/trzULVN/8qbmReQBtv1M13ryAR6QYDx
	sY8oPzhP7NzbiqzelcH/AB8mSUzOyx1T+fxfAT+vxdhKxiLHlHG9fgqe3u5ch
X-Received: by 2002:a05:6a21:6b10:b0:3d3:ad3c:49a8 with SMTP id adf61e73a8af0-3daed3b9745mr10795679637.22.1789154105071;
        Fri, 11 Sep 2026 12:15:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3d3:ad3c:49a8 with SMTP id adf61e73a8af0-3daed3b9745mr10795608637.22.1789154104461;
        Fri, 11 Sep 2026 12:15:04 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm8271959c88.0.2026.09.11.12.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 12:15:03 -0700 (PDT)
Message-ID: <d91ce2be-6489-4399-b035-23f6aec0371f@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:15:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] ath1{1,2}k: support multiple PCI devices in one
 system
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Mihai Moldovan <ionic@ionic.de>, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3MCBTYWx0ZWRfX7ZypOHs+3jnc
 d+zZMyp8gyE2fPuEGjqHoV0xnNUMvMWdN29D7PyBVnQYIZ/AKGFghN3hs2d6FYaQlcZmeMymQnB
 MPNDX8XEAuRtnmVWhWus2dsq92LKCJIPleMAIsprm9CRoC1H+/IxiqZx9os9U1G7WikoAwZKYt2
 dKV2da/IiuRbgb2BPi1U21zhaDi2EhO9+siCWgue475BIAo7gxTi0rxaUFjJ24iD56GVaHa109f
 cIU8BvnYabnrrd7rPxLPSPBaxok77JlmLncMCNFIR9kWCaokiUegwqYspVcnNWKfmtBLYZuGF9t
 A58bWWVo1QP4DNQW4HOe5fI+Gs9w4tZiMyz4rb7DCazThwZzd/32X5VGPzpLmAkxGOKQZPobNJw
 vGE9l7Trz+gHDsIUyWbWB94ugmQQrxVqupnBYuCIgP7BSNSFX8wCmmD59/aVdH8f9AALIftpv/Q
 1smvO3Kjm+sdsyvo7EQ==
X-Proofpoint-ORIG-GUID: yv55b6s1skF1qYywx3uELYuOsOVlHTJ-
X-Proofpoint-GUID: yv55b6s1skF1qYywx3uELYuOsOVlHTJ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3MCBTYWx0ZWRfX0EqOVt7oDmgA
 1zh9IO9zgtvF8IJOY/GgGwNZBQHBV3TpHAP+ejLw11gwDntQtayWoFvlzXYfb1WfhwZGnJopuBx
 ulORXCZ3EjjEs22d6fY/hDDHWuqaXY4=
X-Authority-Analysis: v=2.4 cv=LrwHWXdc c=1 sm=1 tr=0 ts=6aa4533a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=nuVjNcMAjKUeO9L8OkEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_121507_842651_92EDF7B0 
X-CRM114-Status: GOOD (  56.60  )
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

On 9/8/2026 2:31 AM, Juha-Matti Tilli wrote:
> Hello,
> 
> As you may well know, multiple identical ath11k and ath12k devices are
> not supported in a single Linux host because they use conflicting QRTR
> node IDs. Fortunately, Denis Kenzior created a patchset to support
> multiple QRTR endpoints with identical node IDs, and Mihai Moldovan
> refined it, after which I took over the patchset and refined it more.
> 
> Mihai Moldovan also created a patchset for actually adding the support
> for this QRTR multi-endpoint feature to ath11k and ath12k drivers.
> Unfortunately, the code of Mihai was not merge-quality, since it leaked
> memory if you ran rmmod and modprobe inside a loop. Mihai mentioned this
> drawback, without providing an API for deleting endpoints or usage of
> such API in code that's responsible for freeing resources. Also Mihai's
> patchset had a race condition.
> 
> Since Mihai has been busy recently and the previous iteration of this
> patchset is nearly 2 years old, I decided to "steal" the patchset from
> him since he said he doesn't care who eventually implements this, as
> long as it "just works". I am willing to give the responsibility of this
> patchset back to Mihai if he so wants.
> 
> I reverted back to the approach where MHI knows the QRTR endpoint id.
> This is somewhat ugly, but really the only way resources can be freed
> (unless you resort to some kind of reference counting which would be
> doable in kernel, or garbage-collection which wouldn't be doable). It
> does create some extra memory usage in the mhi_controller data
> structure, but a large fraction of the time, the data there is useful,
> since a large fraction of MHI devices actually use QRTR. So this is not
> as bad as making every PCI device know its QRTR endpoint ID (which a
> vast majority don't have), even though MHI can be compiled in without
> QRTR so we have to do the freeing via a function pointer.
> 
> I think the code is mostly merge-quality now. It does require the QRTR
> multi-endpoint support, such as this v6 (I'm soon going to post v7 --
> note that in v6 one intermediate commit doesn't compile on 32-bit
> although the tip of the branch does compile):
> 
> https://msgid.link/all/20260901131934.225991-1-juha-matti.tilli@iki.fi
> 
> I tested it on dual ath11k setup, but more testers would be good. If you
> only have a single ath11k card, your testing is useful too ("given
> enough races, all race conditions are shallow").
> 
> Link to Github if you don't want to apply patches manually from mails:
> 
> https://github.com/jmtilli/linux/tree/athnext_multi_qrtr_v7_multi_ath11k_ath12k_v3
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=218480
> 
> Mihai mentioned in Bugzilla in comment 21 that there was a hardware
> crash he couldn't reproduce and he believed it's a race condition. I
> could reproduce it in older Mihai's patchset version by treating -EEXIST
> as an error, which indeed points to it being a race condition. I believe
> the source was qrtr_endpoint_id_get_or_assign that tried to get an ID
> and then assign an ID if it couldn't get one, while not holding a
> spinlock. In my newest patchset, my belief is this race condition is
> gone (the entire offending function is gone), but any kind of review
> about thread-safety of my code would be good input.
> 
> Original description:
> 
> ath11k and ath12k suffer from a long-standing issue that is partly
> caused by the QRTR implementation, which only supports one device per
> node/port combination and partly caused by the fact that the
> QMI instance ID of the devices are statically set to 1.
> 
> P Praneesh <quic_ppranees at quicinc.com> submitted a patch[0] that fixes
> this issue generating a unique QMI instance ID based on the PCI bus data
> for the device and passing that information to the QMI subsystem and the
> device's firmware via a special PCI register.
> 
> However, it quickly turned out that this approach works for the hardware
> he tested, but fails for other ath11k-based devices, including the
> popular QCA6930, since its firmware just ignores the special register
> being used.
> 
> Since we need QMI (and, for matter, QRTR) to work for the initial
> firmware upload, this approach will not work generically.
> 
> Fortunately, Denis Kenzior <denkenz at gmail.com> cooked up a patch set for
> QRTR[1] that introduces the concept of endpoint IDs, which are
> dynamically allocated and can be used to distinguish different devices
> even though they use the same node/port combination. Using this patch
> set, endpoint IDs can be reported as part of auxiliary data in the QRTR
> socket and bound to for client sockets, which will automatically filter
> messages from other endpoints and also make sure that client messages
> are routed to the correct endpoint.
> 
> This looked promising, and with that functionality, the only challenge
> is to find out the correct endpoint IDs and bind to them in drivers to
> finally support multiple devices in a generic way.
> 
> This patch set implements exactly that, and it WORKSFORME, but
> unfortunately it turns out that "the only challenge" is very difficult
> to overcome due to the socket-based architecture.
> 
> ath1{1,2}k and QRTR are at opposite sides of the socket, with QRTR
> assigning endpoint IDs and ath1{1,2}k needing a way to fetch and operate
> on them.
> 
> The endpoint reporting feature in QRTR is not helpful in this case,
> because drivers do not generally know which endpoint belongs to the
> device they currently handle (i.e., there is no central registry) and
> even if we were to snoop on the socket and take the first endpoint ID we
> are unaware of, this might not be the correct one, because it might be
> in use by a different driver for instance, or correspond to a different
> device.
> 
> The first iteration of this patch set[2] extended struct mhi_device with
> a qrtr_endpoint_id field that was initialized to zero and populated by
> the QRTR MHI driver as soon as it was loaded. Drivers could then query
> this field through an mhi_device->mhi_cntrl->mhi_device chain (if they
> also use the MHI bus, of course). This, however, was an incredibly ugly
> hack because QRTR data should not be part of MHI device structures in
> the first place, timing is critical (drivers querying the endpoint ID
> must do so after the QRTR MHI module initialized, which is typically
> only the case after QRTR socket was created) and it was not possible to
> query or pre-assign an endpoint ID before creating a socket and directly
> bind to it (which might lead to races such as seeing messages over the
> socket that are not meant for the endpoint ID drivers are actually
> interested in).
> 
> Since that was not elegant at all, and due to the other mentioned
> issues, this iteration uses a different approach: endpoint IDs can now
> be associated with (private) backend endpoint-specific data, which
> allows us to identify which endpoint ID is being used with what backend,
> and additionally new API is introduced so that other parts in the kernel
> can either get an endpoint ID for given endpoint-specific data or even
> attach endpoint-specific data to a new endpoint ID generated by the QRTR
> driver. The QRTR system will try to use endpoint-specific data if
> possible, but falls back to generating endpoint IDs without
> endpoint-specific data (as in, NULL pointer) if that did not work.
> 
> Crucially, the endpoint-specific data pointer is used as an opaque void
> pointer and at most compared with data stored in the endpoints XArray.
> 
> In the QRTR MHI backend, we use the MHI controller's structure pointer
> as endpoint-specific data, and since the MHI controller is also the bus
> master and responsible for the physical link, clients (drivers) can
> pre-register an endpoint ID for their MHI controllers and directly tell
> QMI to bind to the endpoint ID at socket creation time.
> 
> The QRTR SMD backend uses its rpmsg_device pointer and the TUN backend
> uses the inode pointer as their respective endpoint-specific data
> pointers.
> 
> This approach is cleaner and works better, because it is not prone to
> races (although it requires coordination between QRTR backends and
> clients/drivers because both must use the same endpoint-specific data
> for the scheme to work).
> 
> There are, however, also issues with this approach:
>   - Any kernel part can generate an unlimited number of endpoint IDs
>     with arbitrary pointers. The amount of endpoint IDs that can be
>     tracked is limited, though, so there is potential for exhaustion of ID
>     space.
>   - Since previously endpoint IDs were only generated by the QRTR
>     subsystem, there was no need to use any kind of life cycle management
>     for the endpoint IDs: they were created at node creation time and
>     also deleted at node deletion time. Since other subsystems can now
>     create endpoint IDs, it would probably be good to have a way to
>     reclaim created but unused endpoint IDs. No such implementation is
>     provided here.
>   - Multiple PCI/MHI devices will work, but no AHB + PCI/MHI interaction
>     has been tested. Since PCI/MHI devices bind to their endpoint ID,
>     these will likely work, but the AHB devices might still see messages
>     for all endpoints and fail to work correctly. AHB devices seem to be
>     using QMI and thus also QRTR, but without a specific QRTR backend
>     driver (going through REMOTEPROC instead?), so this approach might
>     not be viable for AHB devices.
> 
> I am much more comfortable with this patch set, even if it has some
> rough edges and might not fix the situation for AHB devices.
> 
> [0] https://patch.msgid.link/20230111170033.32454-1-kvalo@kernel.org
> [1] https://patch.msgid.link/20241018181842.1368394-1-denkenz@gmail.com
> [2] https://msgid.link/cover.1730790058.git.ionic@ionic.de
> 
> v3:
>   - rebase against current ath-next
>   - solved a major memory leak
>   - replaced O(N) algorithm by O(1) where N is the leaked memory
>   - solved all known race condition issues
>   - Link to v2: https://msgid.link/cover.1732506261.git.ionic@ionic.de
> 
> v2: code and metadata cleanup (checkpatch.pl), no functional changes
> 
> BR, Juha-Matti
> 
> Juha-Matti Tilli (5):
>   net: qrtr: support getting new endpoint ids externally
>   bus: mhi: allow mhi to know about its qrtr endpoint id and free it
>   net: qrtr: mhi: register new qrtr endpoint id for mhi
>   wifi: ath11k: implement QRTR endpoint ID fetching for PCI
>   wifi: ath12k: implement QRTR endpoint ID fetching for PCI
> 
> Mihai Moldovan (7):
>   soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
>   soc: qcom: qmi_helpers: optionally bind to QRTR endpoint ID in
>     qmi_sock_create
>   wifi: ath11k: add QRTR endpoint ID hif feature
>   wifi: ath11k: stub QRTR endpoint ID fetching
>   wifi: ath11k: bind to QRTR endpoint ID in ath11k_qmi_init_service
>   wifi: ath12k: add QRTR endpoint ID hif feature
>   wifi: ath12k: bind to QRTR endpoint ID in ath12k_qmi_init_service
> 
>  MAINTAINERS                           |  1 +
>  drivers/bus/mhi/host/init.c           |  8 +++++
>  drivers/net/wireless/ath/ath11k/ahb.c |  7 ++++
>  drivers/net/wireless/ath/ath11k/hif.h |  9 ++++++
>  drivers/net/wireless/ath/ath11k/mhi.c | 46 +++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/mhi.h |  1 +
>  drivers/net/wireless/ath/ath11k/pci.c |  1 +
>  drivers/net/wireless/ath/ath11k/qmi.c |  8 +++++
>  drivers/net/wireless/ath/ath12k/hif.h | 10 ++++++
>  drivers/net/wireless/ath/ath12k/mhi.c | 46 +++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/mhi.h |  3 ++
>  drivers/net/wireless/ath/ath12k/pci.c |  1 +
>  drivers/net/wireless/ath/ath12k/qmi.c |  9 ++++++
>  drivers/soc/qcom/qmi_interface.c      | 28 ++++++++++++++++
>  include/linux/mhi.h                   |  5 +++
>  include/linux/soc/qcom/qmi.h          |  3 ++
>  include/net/qrtr.h                    | 10 ++++++
>  net/qrtr/af_qrtr.c                    | 42 ++++++++++++++++++++----
>  net/qrtr/mhi.c                        | 31 ++++++++++++++++++
>  net/qrtr/qrtr.h                       |  5 +++
>  20 files changed, 268 insertions(+), 6 deletions(-)
>  create mode 100644 include/net/qrtr.h
> 

How are you populating the list of recipients for your e-mail?

You are including folks no longer involved in kernel development, but more
importantly, you are using an obsolete e-mail address for the MHI maintainer
(Mani). I've replaced his address in my reply.

Please make sure to use scripts/get_maintainer.pl to get an accurate list of
recipients.



