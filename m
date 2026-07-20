Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B5FC44515
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XCGOX7fJC/o6dy33m46UWinQkqK0SLbXzlqRYjxrpg=; b=yhAI+gtnWjCGAuKKTgpC3PPi70
	GdMtJeTG4HNujRdJCKGFiKL6Tkr6QQ/j+/cpZNKBaFYLVuXUzcQN3AUTwdHZUgGOWHGI526j+0JrA
	FwPHwT08eauduWzx9bCRCuNzxLMvrGizFIDzsA8jmunSb3EbiZuFaBe7jcQ2iaj+hNhS0j1SUOWUD
	0yJSVRqWBgBXI3vXgZ1vvkI/xs9Ticp2Nnp1VH3nB4Wv06dvVYst5kR8L9LDY1g2YRV5K6fwLZ4Mg
	Hj7kOLacidCW2e4N7V88d1uhY6a5hKs+YO5aAHYWwb8Y2oQ8+1J/b4v2EzDX/E6evJzZSQFTESpFw
	i2eHBVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlosl-00000006x4W-2TX8;
	Mon, 20 Jul 2026 14:22:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlosi-00000006x47-2zSq
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 14:22:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDrEGK2807531
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 14:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XCGOX7fJC/o6dy33m46UWinQkqK0SLbXzlqRYjxrpg=; b=cUEQGchJXLDNPKkp
	YMl+DEERW59+QoQouT/GUjclYrztuabB8ZI29zgBHGrR3uDcvTtAv5a8EUMVxqSg
	7jNFZif8PFcGoW7vr7jPoTDKe6iQduOFMCT19UHLm4jXXcKUyAS+TYKsAwk+bjmk
	RYuPldXDzDUCduOHLGVlcPTv4BanhUTUqjn5bR/CzyVkzqjT8Qi8bzwpmFk/PWRg
	rv3ByFVJyeZ5a2xYwYutEpQAqwQ8U42U5OZRReIfGaET8B5EskyxYUEtkTf3e2AD
	3KI4+IbLNf5+A/u/3Yf8ITtBmZnR0QEhNi6Q2mAvCSBMXOJznyivzHztidJ1ItfJ
	i5bvHA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre9bkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 14:22:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso2619460a12.1
        for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557327; x=1785162127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XCGOX7fJC/o6dy33m46UWinQkqK0SLbXzlqRYjxrpg=;
        b=bM9k+cJ3qhowxzIUhnYfbRawT43O62nTCFzw61pI4OU+527hHJivk/hDBpkITEmhBe
         J1uAMMWHdKijrxVCLJnw2nPUjvtIb8vLe+xFQqMb2TGMx1fT/rjSgKbdl3rw+YYVOzxR
         E+dzYHQT8GZoiHAn/WJySi4GkvUFoRroA/gFTlBdhO1KUl+mWfTFnMbQejEeUB+C0BcA
         0A45nSBI2/QEBa7cfSCMU4XtEUs/oEEdxmRXkaP7XVsYeMirqO/pXBMcYv/2lxpHQclG
         xm4UR3TtgqMBHdlUQOADkSINDAbL3EXu8w0L+5Toz2wB75mT69NaI6OXUem/iqVIqhap
         NMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557327; x=1785162127;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XCGOX7fJC/o6dy33m46UWinQkqK0SLbXzlqRYjxrpg=;
        b=e3NZ+FIHBRFf/fdey67aB5sasTDkkUP2ofethqJLeUC338U3lXrZ7JLw1GPmlIWUD2
         HGdUH9H4oaoZBgk3CIehahKPeB3YouDDh++27RKAtafKB5ZtgkQHQYDXxdrPcQbX1cGf
         pSl/8rVR5ZXDMZiAE6wt4UJ5PbZpRv543cIg/ySqp7XAl5gTFF/f+ElkVLV+o9qwEoxq
         0S+OdMHq0HlutsFwI3RjX0lj27885C3ae/MZSaslnH6d8We494nWeC426VX/hz1KyOeC
         TA4x0UVtPN/Z5g7OQyHgUFbGcnz6Ok8xHJCxIrR2XTNpNlrBY+zSVImMeVIVn6wy+05d
         D9eA==
X-Forwarded-Encrypted: i=1; AHgh+RpBqRTbG7yCCHX8N+VbSahc6pSPWFRdLbuTL7ynOhReW7zsx/ETzC3Sx8rsIA+UQK6E69/HGeg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyas3bolGqUO7miVGYHrstD5liiL6hePG8YLBnymwq2Hd0LCKfS
	TzRjgu/7fnhf9A1W384HepAz5IPA9FAMy+jH4D4PNtZVX0ah3v724K0pUb0WZpfhQdA3YBUTdvI
	yoe8qBqxtqdXWZRrtGhKuupeEbBb+Ur7H+hIvzeicjSXMA0MhCmYtm1nat9XRM99y
X-Gm-Gg: AR+sD13rx1MlZbWOOpq4WyFRPOvHtV/v1mVOSYQk5nFCPGwvaaW/ohgUq+dZZ85leKM
	hJYvPtzYudaKeiiwUqONPNXU15Crvn1sij00hPXdN97eE1YyTFezMUi52AdBsq9vBAASSosqulP
	ZxXtfi/RS9pvYmD7SIwCX1QPHWC1if0/F9klC6qqwCLuZsYAl9uCKF07NCDNZXzxzGC9w2wkmRo
	NCWla91W7WSMp3di/YtJyJs18PqcwfL7UE5jyOiQKvn/j+iz3SH0kQ/looa26zFaVE1FSzSIrTc
	6MOYgA3M+yY48crmcjNRnSnzcbaiSdCWM65x8JoBsCn18vem6+PFwmE3gN7UFgf9AZfjwX0jqN+
	tK+xQIVblrUKnb2KYxoCJ+/wTBxbnmmuZQwhCzaZ87AxDq+12JLHR8F8dzBil
X-Received: by 2002:a17:90b:1345:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-38e3cfd30a6mr19437479a91.0.1784557326670;
        Mon, 20 Jul 2026 07:22:06 -0700 (PDT)
X-Received: by 2002:a17:90b:1345:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-38e3cfd30a6mr19437440a91.0.1784557326220;
        Mon, 20 Jul 2026 07:22:06 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2a48sm27471571c88.2.2026.07.20.07.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:22:05 -0700 (PDT)
Message-ID: <d81d02d7-e37b-4e66-ac97-3c14fcd55641@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 07:22:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix survey indexing across bands
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
References: <20260703-ath12-survey-band-fix-v3-1-2fb050c2505a@collabora.com>
 <8e4a3842-4fc2-4a05-9142-6fd8f23751ed@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8e4a3842-4fc2-4a05-9142-6fd8f23751ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MCBTYWx0ZWRfX2ATmrTYEQLZc
 37rwYUKm2hkCw9NXO7ASt+rLAk0SfPEEcdbaecs7WFhBFbe2F6TTaxzXjtJOGAi7jISF9XMnjTU
 P+UH+PcKusCi7vizopIa8b3ahvrg+q4=
X-Proofpoint-GUID: XEiAXiMgFWgdILeX2XdKMC0QfFkl-wYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MCBTYWx0ZWRfX2+/+Zn/3Lgd1
 1RdahfsZ+OHul+fL9WPmFxOhWtoMclI4zpqSnPpaD6SuLgmCYD1hyQSHKRksKndG6gGIJLnVk6e
 f7qcL8GSYPjLFoHfdRKdrqhbbWsmrb5uCMcwnt/qKmUk2/VsyoO4vEnU5Axmd+eliQd0xs0vRCY
 jgiitcWwEzx64BgUrQaJ4hnxJLihCMxJyu3SPIP3sU3St9hZ4S/awdhaZEmkdeBavhNwBctlws2
 XLmrDe5lGz1eEpmK5XiWrnchyTv7kuBJFILdHvkE5N/GzcTfYn8nqd7Vo9vsUgP9fd+TPs4HX2p
 GXhNu/cy5nQUc9buH1DFhzDBlLn49a7/6FlUPeUaiwu8A99ACiQNOeJfKaxjGe5xVP83u4R3HFp
 +IFO2fgX4B/FCo2pmBiDmDSYJHk+jheudYgtRLjrn0sz9q+X8woZ+yTXw2oydLwx1pQhNokJak4
 yzsSqYr9idWsrGfYD0A==
X-Proofpoint-ORIG-GUID: XEiAXiMgFWgdILeX2XdKMC0QfFkl-wYD
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e2f0f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=MbpG7XlEKC8dfAHvq1UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_072208_894929_9C207F5F 
X-CRM114-Status: GOOD (  14.21  )
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

On 7/20/2026 7:01 AM, Jeff Johnson wrote:
> On 7/3/2026 8:56 AM, Matthew Leach wrote:
>> When running 'iw dev wlan0 survey dump' the values for the channel busy
>> time have the same sequence across bands. This is caused by indexing
>> into the ath12k survey array using a band-local index rather than the
>> global index passed by mac80211. This results in surveys for 5 GHz and 6
>> GHz channels returning values from 2.4 GHz slots, making the survey
>> unusable on those bands. Further, there are redundant survey slots for
>> multi-radio/single-phy instances.
>>
>> Fix by moving the survey data into ath12k_hw so multiple radios under a
>> single wiphy share one table, and index into it using the global
>> mac80211 index. A new spinlock in ath12k_hw serialises access to the
>> survey array, which is now shared across all radios under a single hw.
>>
>> Band busy-times Before this fix:
>>
>> 2.4 GHz: 9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
>> 5 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
>> 6 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
>>
>> After this fix, times are independent:
>>
>> 2.4 GHz: 23, 5,  5,  12, 2,   12,  26,  5,   3,  1,  27
>> 5 GHz:   30, 40, 29, 27, 118, 118, 112, 120, 11, 11, 11
>> 6 GHz:   1,  0,  0,  0,  0,   0,   0,   0,   0,  0,  1
>>
>> Tested-on: wcn7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>
>> Fixes: 4f242b1d6996 ("wifi: ath12k: support get_survey mac op for single wiphy")
>> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
>> ---
> 
> my review agent flagged:
> "file": "drivers/net/wireless/ath/ath12k/core.h",
> "summary": "data_lock comment still lists 'survey info' as one of the fields
> it protects, but survey data is now protected by ah->survey_lock",
> "failure_scenario": "A developer adding survey-related code follows the
> comment and uses data_lock to protect ah->survey[], introducing an unprotected
> access (since the actual readers/writers use survey_lock, not data_lock)."
> 
> I'll update the comment in my pending branch

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=9ff6ef3b7b33d9c4afa898581a99ca86dc8b5004


