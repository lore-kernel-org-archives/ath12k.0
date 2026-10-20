Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BF8606A325
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mgugKrlj;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IccQvnrD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWxcIcIU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=; b=mgugKrljAGS0s5ITrYyOub14iE
	4uO0gAoiQp9me/aMHuvT7FwYjJEc4j6QCXDcj47nXPwwPmsoPV62FM9oq8TCMC4tNwhgckpvJx2QL
	PEjUHfhoKjMxXQpUs1oJqPuNc+N758DHUzGfOxJknQAerq97qhuaHNd6Q+1m9NTj/oH1muHQF0Xco
	MdMoCZ7U5iU9D5kVjPhdh6XSbhdg8DCEc+QM3yH2rRc8FWsXFfP+DCFJK9NVA2ElPTn7TNWo8moq3
	I4ndam+9H+8LNu+cj9jhhXH7ROZe0MCrYR6Vu2Bpa17x4cJzFvqbAZk3P+cKsyfKokElyXYMCnbn4
	cMtDrPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Li-00000009CTg-3nx7;
	Tue, 20 Oct 2026 08:37:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Lh-00000009CSu-0LaH
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 08:37:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8PSXP4032824
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=; b=IccQvnrD6BnBFmAv
	OG60Wr78t3cKbAbIa70H9REzsYKxbflhpbYPcYj2NXSmANT+2GbiA8gcdkYvkLTD
	mzZOwcG+Rmd2GgwbreXe7YGOz2X9Vd7Ic9pXvzb+l8056Bb6VnE1Bc42i9JiaKjM
	SMKkjiZ/Uwa73vkcB1vH6L1avb5WIwAkJKM0rkvUcI5QUpPR+drQT+YF9jIAA7dO
	hrGUCDG87meXIBQOkm+ezdVCPYCLq2+W+lCRTA7AeOTMUfQVYkFbKTCLLUAzG/bL
	sYQymqQg/PoXWMq8f1Eik+m81hxypCrOdwqDOg/dkBc+94I4H5yytLu+WvatLzY4
	AGOVOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9m8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 08:37:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso26935795ad.2
        for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485451; x=1793090251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=;
        b=dWxcIcIUOwgh/NrsrvT0aXBgEAYAP2VIys84279hkvM+fyN12VStbPOP+y4ugkQW6M
         nVNGtbRfVf8F9BovXDHrUbftyU3gQwGossKpKrRCHUuxq/+1oQ/gaEMnnw8Nk9dczDLR
         hBXXFYA52IdT5vTGQNEfT47iXj7697MqZXJmbR1/PRokqcfHc4jbtknNkGf6Izjjo2gB
         g98sbwwWBBsUKMecbcaotkuli9oGVsvnnig5ASxfQzI30F/eds9sEFYftpvXHH2wj0pu
         Iw46N4GhlvzE/wJqCRpMAt4GCkzaLl3BzxRXvg12SoHJQX+riApuuSErzmSwsWbwznkR
         tQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485451; x=1793090251;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=;
        b=aJRBM2HN9Acyn1HJB4cafCWkn9X34737bJS7apS3Z8Ab7QAnXFSqDPv5TwXk88YAlh
         Yy2rqbHeY5RFZ9J/xFMojPsUHacnJ975POvFcURIIZT1D7YT9y6hn3iHSIKsfL42QKBV
         1HFFvJvpH2pKNMu1bxTTXOu2D0FDqkfbvDyLj9VI5xuwIvaYiBtTxOuSLGFTzaq3F0vC
         U3IDv1nKW6sciqLnTPxGgk/CXZMrvibb7m9VXpw/3pjEEJqSuD0+Uc3c0ijf8a4dxiSA
         oORzHA90KWB1hViyF9EYREL3a1fp07KMhlb+a751KyIkD+21usF+qiKiQtr2wiOaj0yO
         TyPA==
X-Forwarded-Encrypted: i=1; AKwUvBzsg4qYVq6ObDWHl+XryJjlJwvPYwxMfjhWx9/7ADM4+96NKx9SJfOneqpaOA2vrh6H/tt3Ehk=@lists.infradead.org
X-Gm-Message-State: AFq9FYIPX/OmJQpsgzuihFzUVt7H09vdUOFFRpwElT0BbGpUdHt3v9e8
	32te32b9gwemZrqiEhlSgbIZB4mT98g19iwZcNYxtUSXLjRAGCluLN8aPu9rXOcxYBIoVbQHXwx
	2mP21kEwrpt2I67FcA4F/4YJ3CSrPma74L5uR7eLmG5n1fgPpm6M/J5soQTHvTHzy
X-Gm-Gg: AYBFou1J7GBziSSWjeCcfhP3rmA9oHdwc4Z/dUhOVthhivZQfLCPNHyL94eT5QKQjn1
	ZgsMDN/98P2Ksr50Bmp9A6ovuwx8BC2EIL3FGFQcC2+BKT9xD2lnAIduX6wr1h7gJDvFUf+Kjng
	Rnn7MTaWb/y70EqYd5/a5KdpgrWfaBQbj5OUYqaffecVv2rg5QEGPvjqkPIY3UlPporKkjwjrtA
	rs2ZOXT1BUK9fQtVpuCWEeho68UG42p8HVKq5Se9tSK3CSjH7STXWxURJZFSY3dasxxx9r3iag1
	2ePh+RzLdmOOQLYDF62HZ5aJbhWTxLd+er4MCUrpAwM9l0sN67JAPNd+DRup/lpcvF7G/981vD2
	CRtFNBIg8yftvfWDk36W8LC09SS3l9DX1m/I9BHNPgFTOFERv37G7vYL06GlxYVDcw/iwjRd2
X-Received: by 2002:a17:903:2290:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2e9a69f724emr81145755ad.16.1792485450991;
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
X-Received: by 2002:a17:903:2290:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2e9a69f724emr81145625ad.16.1792485450488;
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
Received: from [10.133.33.78] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea15019084sm9823665ad.41.2026.10.20.01.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
Message-ID: <f0c329ad-a13e-4bd3-b630-c0137a5f42c9@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:37:26 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix MLO station firmware crash
 recovery
To: Johannes Berg <johannes@sipsolutions.net>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804175004.1761075-1-jtornosm@redhat.com>
 <20260804175004.1761075-2-jtornosm@redhat.com>
 <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
 <1c8bd087a5cfd54fbe2825f2fa19a7851357ba86.camel@sipsolutions.net>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1c8bd087a5cfd54fbe2825f2fa19a7851357ba86.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e9lCpOBzaNzM2-fS5OipM2zh_sNqx6Zu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXw5c7lQHsRQ09
 dre7HWPDOQAwR0zlxibrrwC3gdnIXjiS8l9aYZeftI1RzbxQVfxRMLzf1cWDX/77I1vEwy99Wiv
 O85ahPArk9E8YOwdVVByrgVuM1rMjfAV9xr3/9rHlB11v0paqFE9xQKpYdbkmU9KaJORCueoCxj
 6YHvp+Pee9bxNPO1eGfuhTopetxFUQwle2o+fVPKceBcHVHewrm94ll7J1c7NiJKT+F5LgelZ2h
 vIU3iOlRL+GF7Fkk0MmKtL8pj0jM4aijkKKkBrmymTnX0CaAs9lxbrJRJC57gzJVy8VCanP2NZa
 9xZ0BksWQNElT2GKrXarGFb2FVn+l3sRw4aadUvG+bAyuu5j+PJB1sJwJdpZlr5eM6HsC9L8Uw6
 Ydbmwm4rm4Ey3WgbVO6OX5VbbNqh2djqhCHxO9EI+iQnciOLKAT5MBTjaYpX/X7zy+JYG7YPHpA
 uSzRDYEW48VrjeWZ1ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX6TCDD3fjgCPi
 J+TlPJve8k+2sGSfa/7ZP2f4O396Xrj9i87cZ7jtdMn+0njqyHKB+WuJoN86HVtKfBiNolLO75K
 3ef3jWxBQJChAH39SVyVPH+o1QxmqAc=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad7284c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=j4zPaZQj4CSWEhlzwlkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: e9lCpOBzaNzM2-fS5OipM2zh_sNqx6Zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_013733_236435_A879158D 
X-CRM114-Status: GOOD (  29.01  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/17/2026 5:33 PM, Johannes Berg wrote:
> On Thu, 2026-10-15 at 13:51 +0800, Baochen Qiang wrote:
>> I don't think patches 1 and 2 are the right approach. Guarding every callback that can run
>> during recovery with a RECOVERY/CRASH_FLUSH check doesn't scale, whatever callback we
>> forget today is the next crash report. Besides, such guards don't help those in-flight ops.
> 
> So I can relate to that, but ...
> 
>> The trouble is I can't see a clean driver-only fix. The driver knows the device is gone at
>> crash-detect, but it has no way to tell mac80211 to hold off until it calls restart_hw().
>> in_reconfig would do exactly what I want, but it's only raised inside restart_hw(), which
>> is far too late for a device like this - by the time it goes up we've already taken the ops.
> 
> mac80211 has the same problem? How would *it* hold off rather than
> annotating every callback from userspace, debugfs, ethtool, sysfs, and
> the rest of the kernel with checks? *Maybe* at the boundary _to_ the
> driver, but that's bigger than the boundary every individual driver
> has...
> 
>> 1. Do the whole recovery inside the restart path, i.e. move the whole thing including
>> state reset, power cycle and firmware reload into the driver's .start() reached from
>> ieee80211_reconfig(). Then it all runs with the wiphy lock held and in_reconfig already
>> set, so the sync is free and no new API is needed. The downside is we'd be holding rtnl
>> for ~1.3s, which I don't think you'll like.
> 
> This is what iwlwifi does, but it doesn't take *nearly* as long. :)
> 
> There might be a chance to disentangle the RTNL from this given the work
> I did recently on disentangling it from cfg80211, but then on recovery
> *failure* we have a problem with cfg80211_shutdown_all_interfaces().

Hmm, I wonder whether the restart work could take rtnl only around
cfg80211_shutdown_all_interfaces(). From a quick look,
ieee80211_reconfig() itself mostly only needs the wiphy mutex, except
ieee80211_add_virtual_monitor(), which asserts RTNL. Though any rtnl holder that then
needs this wiphy would still end up stalling everyone while the recovery runs.

> 
>> 2. Let the driver raise the barrier early, right after crash is detected, e.g. split
>> ieee80211_restart_hw() into two parts behind separate APIs: the first stops queues and
>> sets in_reconfig, the second just queues the restart work. That way ath12k can do the
>> time-consuming part outside the rtnl lock while staying in sync with mac80211. This would
>> also need a few op entry points that don't currently check in_reconfig (the scan entry,
>> for one) to be filled in, otherwise raising it early doesn't actually fence those ops.
>>
>> Does either of these look right to you, or is there a direction I'm missing?
> 
> See above - I don't see how we'd really implement the latter reliably in
> mac80211? Sure, we have a bunch of in_reconfig checks, but ... I
> wouldn't really trust them and I'm not sure we can guarantee them given
> the surface area.

Fair enough, I agree. Looking at it again, option 2 would just move the
per-callback checks from the driver into mac80211, with an even bigger
surface to cover, so it doesn't really solve anything. Let's drop it.

> 
> johannes


