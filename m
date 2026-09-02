Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F387C624D0
	for <ath12k@archiver.kernel.org>; Wed,  2 Sep 2026 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1c4l4NjJNyna0JXM1EZySsOREA38Ii81XrbtM1fCLBA=; b=PNBDpfPaN8c9XBZcsOxPU5OOBV
	NhZYp8mJsyso9jua9Ty5Y1EbFzgExHeerwTwchKPrN9inllc2YFY0GG9xLe6wx2w1H5i2KT8DY0FC
	ajQnVxJXdtLLABjrRz0FGISOf5LzQMiruULHrnyP/MliXaRx0APf1QjpWeAnRGf2u7a9rssJq5Mko
	/KhRYqQskvTPd6LlA1TM8PuI8/neZmLoVNJ6bWq1qYRHT6BekwYWmleRY0BcggW9VVSa7xAtQ8NnC
	6EIC68XLrz/C8/HGDayJOF/yVPOjdKXAO2gDawemJOixdw+XGdDbNnVVfkzH9v3B/qG6Vu5HuRe5H
	ukl7eafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iVC-0000000EOVT-0seY;
	Wed, 02 Sep 2026 10:47:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iV9-0000000EOUN-1sIt
	for ath12k@lists.infradead.org;
	Wed, 02 Sep 2026 10:47:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829N3BP1080197
	for <ath12k@lists.infradead.org>; Wed, 2 Sep 2026 10:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1c4l4NjJNyna0JXM1EZySsOREA38Ii81XrbtM1fCLBA=; b=Xqoh47VPX8C0zEXP
	9RODhSDri81H5k7OGC+9XV4Vhjj7FOQqaod+URJcKFFIz07OPJdk1h8Qio66IBhU
	yL/FZt3VobIiqvW37pwcnrk1hRBI6shv5NSunVPhyqlX1JbT0fWFRTTraAeVxKM8
	MNTwS9joFGNaMUWL7EvPnBzQwSBu31IPImIJHQ5WFMRLAx1rsmC18uO+3fxwGzM1
	BA5qOLlJ2uBlvrL2ngbcKwHgtAMQ8c9gecPOmfLFY1wsQK70Wb4O3aZtJDsAI2A+
	qrWbC/jRJ0+YQkVhZBIMuCbbA4CybO1mCLjv5osRY6RIFR5vMRPdMDdpsu/PUeEp
	bwImpQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb561rhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 10:47:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1857380a91.0
        for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788346049; x=1788950849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1c4l4NjJNyna0JXM1EZySsOREA38Ii81XrbtM1fCLBA=;
        b=Oq+tZtPx2QDzTor17pk4ky6jpFviDHcyFmw7HsMFLNJEpfAubDKQh8ZIRdMGN0rAJf
         ZPW2Ol35SjqadHoSPG8yWOQjxEA3USbDnk9YHj52rbV7JdOvoJnt8foo97kXgKbGWQPw
         OY5rS3PfLRUnx/HaX56rH75QKEqSyRLr9qSzAeNnogDOeUaQ+YGlNqGOQvbA+09ncbjB
         J9U/obFILqkW7qasFPPjE0dtdEou9w8gtIDPPyV00DkDiHGhBRRP5m9CHDSyaOJ9jRA9
         fLJOlIWOcfwHRADSOLQIGQ0Bkb1J8wdpqKg8wv4J287wDhLKtOz6vDKhEz5LCGY5bFWZ
         tGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346049; x=1788950849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1c4l4NjJNyna0JXM1EZySsOREA38Ii81XrbtM1fCLBA=;
        b=X6HNps0AGzmoP+vFaYc+zmxTfVYoNs5CkY5hdNwuCO1Au3iI1qiZlVGZRL4r5FDcKi
         GCCmGy6l/IFnpOvymAN6O1fztYtekHfizye5BgCPYK9UhRPAr3PfoHIr+aeQNnHEQW/T
         9gO5fS+WQlFhSUrbtAFdmXEa0pz4tSlkMxL0DGiWdMp4R3P6JCGNeh8clz80MH50l8T+
         TrZHB/b7JmMR84KLNgg36cla3t1oJDo3ymYEzLwU5sZ7SjuHNkd0++4PguOxdL3RLftx
         RsONZytpe/AymX4J0scm/JwyEG9N163t7iu8e83wvpiENk22l10ZzO3Quikqo88CrLCF
         uQKw==
X-Forwarded-Encrypted: i=1; AHgh+Rrg97vSMqDTVeDXy6wmWCamgL9kOn7QGsevoTbzbk17qxUrnEHxhAOcwiQhCoiI9vROD5/m/wo=@lists.infradead.org
X-Gm-Message-State: AFuF++ngqqUACFcoryCu1Gvf1gSMfDtUdQAlmoksNWKCmOKKoAsUGbZV
	vKTVnTzipOo7jTzhdwtuzlj2F+FxL82UfnwvWkJ5+IC4ipuVD21Xxoz9/Uf3vat9rgj2hUDkY6y
	EmPGyi6S3V2dEe2Wn5UnqUH5THyqCUe8/AeqbggF1GC9z36Li0qO57dmu580erGlY
X-Gm-Gg: AR+sD11XSDHcwmt3iFeLAcX9WOahmB/8JmgOeJb6abPvNTLUbkg1o9qWgl9aMQe0PPc
	nAZ5X0gStUCs2FsXA/v4S5HRH1eqGvX/DbJlluGbRo/T+Xbg2wOi5Tsox7Z9YD1ANWOBsDyg2Uh
	vIQKIvXkc1qCoz+YcAcMXZM97qKueBjStXb5zsSvt7VCFJCd1t/Jp7uVp/f6CzRKpqJMGU0f3V+
	BGQ6KuDxa4rXGNshJJ+AKnbCxGnjd2Aeygr+6oir5XHnTqQR40sgSSkmVktgpFE6WKwosIW0OMH
	AuZZpXLeQe7ZEWaPfWH4QB1PUJpiBoVXEeNXwvQufnLtyJyJVUAfkTaeMRrTFWVBtf/JWFg9vWG
	FkqUXEDbJ4BS5gWc+pd6Mm8gqoAqbLPmrSM8=
X-Received: by 2002:a17:90b:4c44:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39aee0188bbmr6061423a91.11.1788346048935;
        Wed, 02 Sep 2026 03:47:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39aee0188bbmr6061321a91.11.1788346048369;
        Wed, 02 Sep 2026 03:47:28 -0700 (PDT)
Received: from [172.20.10.2] ([152.59.48.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f27047sm5119750a91.5.2026.09.02.03.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:47:27 -0700 (PDT)
Message-ID: <741d7c3e-6eea-4a84-bf4c-8d8eb8032c83@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:17:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IPQ5332 multipd: missing text PD level and qcom,rproc ownership
To: Hideo Sumi <hideo.sumi@mugops.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20260902041339.7665-1-hideo.sumi@mugops.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20260902041339.7665-1-hideo.sumi@mugops.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NSBTYWx0ZWRfXzgENezHBMtHP
 Gtz+xVFsWI5DiFI8Ee+pA/DLWnmilULw+Qcaxk0HCF1UnSvV3zJC9aCNf8hjPUcQhdGhRt5XHWM
 AZejHwxODWSpYJWQSu2vOdcpCimbNfTAljEQsVoSUiOvUBxiirLJf116c1yDRZskY0RfqxNd0bA
 XoCTqWVBKengEpepPpkySwTr1AIJEEl4atYzBcvkqvQj+HR0rYAGs9qvBk/51CEggzPy2lV0Ncs
 kBDG8Y+VTPzY6FonGpHBicQBrlkoxKWjZQPlhAylZA3usIseTCqD6mGY6y46w0faDNRatO2OZkS
 OOFBP0tlYu0gpSUT7OxN3m2cFOG1LVFT7WmZsUT8iLx/5LJHhlxY6DJUbruN8vvHHC9QrWWW6mp
 bh4S+btrJE7+Cti91SuoMK1Ep5M8oCwaAe3YPVSSZ7WkSQCXffgf1IFJVtb9QNxZtFsmOqgGnFQ
 RpgiGbVSDjNBoz1zaQQ==
X-Proofpoint-GUID: NPXihB0CtsTa5UpT114sXSikosvLsLSR
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97fec2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=O5pfq51LmT9kH+AdY1uYEg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4vZXxqc4KIhUxI1rvgMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: NPXihB0CtsTa5UpT114sXSikosvLsLSR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NSBTYWx0ZWRfXwv8awuknolFh
 7jnBYIH9D2c33iZyEpMMvVAyro68T8Nml6ib+x+Q4pbyMYJFdgEz+EWArA/JzGPs2r2Fiy62y+f
 hHbJHZ2upFlN+wbyxORp4CGs40VlRn8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_034731_612897_A4452383 
X-CRM114-Status: GOOD (  44.33  )
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



On 9/2/2026 9:43 AM, Hideo Sumi wrote:
> Hi Manikanta, all,
> 
> I have been bringing up the WiFi subsystem on an IPQ5332 board using the
> multipd remoteproc driver (qcom_q6v5_mpd) together with the ath12k AHB
> backend, on 6.18.44. Two things came out of it that I could not settle
> from the code alone. Both look structural rather than like mistakes on
> my side, so I would rather report them than sit on them.
> 
> Caveat up front: I am running vendor (QSDK) Q6 firmware, as there is no
> upstream firmware for this part. If either answer is "that is a
> vendor-firmware-only concern", that is a perfectly good answer and I
> will stop there.
> 
> 
> 1. The root PD does not boot without a text PD level, and the binding
>    has no way to describe one
>    ------------------------------------------------------------------
> 
> With the DT shaped as the binding describes -- a root PD with user PDs
> pd-1/pd-2 directly underneath -- the root PD never reaches a usable
> state:
> 
>   qcom-q6-mpd d100000.remoteproc: fatal error without message
> 
> No further diagnostics, and the user PDs never come up.
> 
> The vendor DT has a level between the root PD and the user PDs: a text
> PD (compatible "qcom,ipq5332-mpd-upd-text") that owns a separate
> firmware image, with the user PDs as its children rather than the
> root's:
> 
>   q6v5_wcss             qcom,ipq5332-q6-mpd        q6_fw0.mdt
>     text-pd             qcom,ipq5332-mpd-upd-text  q6_fw3.mdt
>       pd1                                          q6_fw1.mdt
>       pd2                                          q6_fw2.mdt
> 
> Once I added that level -- a text PD node with its own firmware-name,
> the user PDs reparented under it, and a small driver change so that
> q6_register_userpd() recurses and the PAS ID is derived from the node
> -- the fatal error disappeared and the whole chain came up:
> 
>   remoteproc remoteproc2: powering up pd1
>   remoteproc remoteproc1: powering up text-pd3
>   remoteproc remoteproc0: powering up d100000.remoteproc
>   remoteproc remoteproc0: remote processor d100000.remoteproc is now up
>   remoteproc remoteproc1: remote processor text-pd3 is now up
>   remoteproc remoteproc2: remote processor pd1 is now up
> 
> The ordering is the interesting part. "powering up" runs child to parent
> as rproc_boot() recurses upward, and "is now up" comes back parent to
> child as it unwinds -- which is exactly the parent-first dependency the
> multipd model exists to express. The text PD simply was not one of the
> levels it can express.
> 
> So: is the text PD level deliberately out of scope upstream -- because
> upstream firmware for these parts is expected to be packaged without a
> separate text image, say -- or is it a level that should exist and is
> not there yet?
> 
> I ask because if it is the latter, the binding as posted cannot describe
> this hardware at all, and that seems worth settling before it lands. I
> have a working change against qcom_q6v5_mpd.c and would be glad to send
> it as an RFC. I did not want to send it uninvited if the omission is
> intentional.
> 
> 
> 2. The vendor DT and the ath12k AHB backend disagree about what
>    qcom,rproc points at
>    ------------------------------------------------------------------
> 
> This one I can describe precisely, but I cannot tell which side is
> meant to be authoritative.
> 
> In ath12k's AHB backend, qcom,rproc is the *root* PD. ahb.c resolves the
> phandle and boots it via a function named ath12k_ahb_boot_root_pd(),
> waits for rootpd_ready, and then does the entire user PD lifecycle
> itself: qcom_mdt_load() of amss_<n>.mdt into memory-region[0],
> qcom_scm_pas_auth_and_reset() with a PAS ID it computes locally, and a
> spawn via qcom_smem_state_update_bits(). It also requests the "spawn",
> "ready" and "stop-ack" interrupts by name to drive that sequence.
> 
> In the vendor DT, qcom,rproc is the *user* PD:
> 
>   wifi@c0000000 {
>       compatible = "qcom,cnss-qca5332", "qcom,ipq5332-wifi";
>       qcom,rproc = <&remoteproc_pd1>;              /* the user PD */
>       qcom,userpd-subsys-name = "q6v5_wcss_userpd1";
>   };
> 
> There, remoteproc owns the user PD -- image, PAS, spawn and the same
> three interrupts -- and the WiFi driver only attaches to it.
> 
> These are mutually exclusive, and on this board they collide. With
> qcom_q6v5_mpd instantiating user PD rprocs as its binding describes, the
> PD boots fine and then ath12k cannot have the interrupt it needs:
> 
>   remoteproc remoteproc2: remote processor pd1 is now up
>   genirq: Flags mismatch irq 31. 00002001 (UserPD1-spawn)
>           vs. 00002001 (q6v5_wcss_userpd1_spawn-ack)
>   ath12k_ahb c000000.wifi: error -EBUSY: Request spawn irq failed: -16
> 
> Same interrupt, same flags, two requesters, neither wrong in isolation.
> 
> So which is the intended division of labour?
> 
>   - Are the pd-1/pd-2 nodes in the multipd binding meant for non-WiFi
>     PDs only, with WiFi user PDs left entirely to ath12k -- so a board
>     with only WiFi user PDs should describe none of them, and point
>     qcom,rproc at the root PD?
>   - Or is remoteproc meant to own them, as the vendor DT has it, and
>     ath12k's AHB backend should attach rather than load and spawn when
>     qcom,rproc resolves to a user PD?
> 
> I have deliberately not sent a patch for this one. Either answer implies
> a behaviour change in a driver used by boards I cannot test, and
> guessing at the ownership model and then changing ath12k for everyone is
> not mine to do.
> 
> Happy to test patches, provide full boot logs, or run experiments on
> this board -- it is on a serial console with a recoverable second
> firmware bank, so I can iterate destructively without much risk.
> 
> Thanks for the series, and for reading this far.
> 
> Regards,
> Hideo Sumi
> 

The intended model is that the root PD is completely managed by qcom_q6v5_mpd,
while the Text PD and WiFi User PDs are managed by ath12k.

ath12k will take complete ownership of the Text PD and User PDs. This includes
loading the Text PD/shared firmware and User PD firmware, as well as handling
the corresponding spawn/ready/stop-ack interrupts.

The shared firmware support is covered in this patch: https://patchwork.kernel.org/project/linux-wireless/patch/20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com/

So, qcom,rproc in the ath12k DT is expected to point to the root PD.
The WiFi User PDs should not be independently managed by qcom_q6v5_mpd, otherwise
both remoteproc and ath12k would try to manage the same User PD and interrupts, which
leads to the IRQ conflict you observed.

The Text PD is an additional level in the ath12k Multi-PD flow and is handled by ath12k
as part of the WiFi User PD lifecycle.

-- 
Aaradhana Sahu


