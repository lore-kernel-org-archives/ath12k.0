Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE01C44508
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLV1mDiBkZv+B5vStQykre0lNo0Sfl+ieKWnlVoNGUE=; b=KyJYhrNvsGtqhUpgnM47grDXsL
	qyO1WC/433II5LoMuFyP5AnSd8ZwzOCguQrQ6/hP9DZItlPUgZmUarUfWsLZQ6JLiY8xO8NzUUA9T
	YuoGSi79q44Vpww8QDsBPkHfmtxZvnPuD5eVCIOeV5xzQOOwgK3YUJH7vkzhRcKdiGndNU7HKNOlV
	lctyb5ohST3ztlKuOSAdwhLBOvQ0JDnmJDM1Wd0AGgIF93m6qqf/Zp1/lXuIUb8LzX3N1oimJcThO
	NcFIuz0oLDq+CA9/L2uWSey6cMs0xI+m3dJa/0WTYaszL8urqBAPMG4OKG6QwfHBPAIlNhzMSHeIr
	zo7whoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhYC-0000000CqI5-3G0R;
	Tue, 14 Jul 2026 18:08:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY8-0000000CqCp-2VSN
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:08:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6u6V975504
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLV1mDiBkZv+B5vStQykre0lNo0Sfl+ieKWnlVoNGUE=; b=pZFzR3bFHwTLWnWL
	xLq0qG19qt4SpFIDur4y9JySQUre+2umV4ZwCVoGjD8Gp8nTs4gmguAOrLH++5Wr
	5SpZZJNko7I+2wWhCeIwEOSDSz4A/EugVD1ZhhXlTIFVHibCXcWj9hX/Ad32Z3dR
	lEiovyWdY6CmPmanoCNIcaOleKztMU6mMeAP+gDraBLHqUsJpB+vKYlDl94AKkh5
	rbfIaU1OcZ3uAwZcKFw1dxKx2HE2313DNYrPa2k1dN9lrrdPRq370sgEtMtOn0YC
	kdvUTpKWF1l/qeiePT/kPDkrJ1lVi8E5DbOvY1V3GapBeMUQkZ0C8vNZeA4o+sSX
	TyFt1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2kab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so903979585a.1
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052487; x=1784657287; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLV1mDiBkZv+B5vStQykre0lNo0Sfl+ieKWnlVoNGUE=;
        b=WvFLgp9j/URWQLCirpYFtHTRC6KCpVYDWuKtOWyw4shLHuQh5jgJbGH+e6r1oa5Pfd
         7u3JNnWjUJqzqg+qinvtrPg7XEEnmyctMeVKT2PW+8FhKB7Se8PiGekit0a9BOVswrZl
         iAuFgHQccKQqGHv4y0p3v/8xguuNWRrLPAI+n6nA6ltWVpaxxaba8mKWOtH9IiStxtID
         dSMuUoo/JdFSyZdHwhSGpuNa7uEAlzGz+PWFncXFvBmtxUMhHzPgg4Q83BZGyKusTC6a
         YcDoia7PrHiBSzKdUzPMgjP6Cn6ZgLCpuyXPv/gmpsrnx1mQYTBvZDD/C0oUYLCjL2Jm
         jQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052487; x=1784657287;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLV1mDiBkZv+B5vStQykre0lNo0Sfl+ieKWnlVoNGUE=;
        b=qBclFQIsMYrALF8PZAIMljvxNsR8haoA+c6rz1kSxQ0zO9nP3y/KK2BhFX8bI7Ycvq
         GI7j59brqGgveTwnMbxNVBtbILwd6PIxzdVF1vpuC2a99lzojw7wikHhhBTR2WQAjGaq
         N9HJek1UIQGaqLgmZhsRq9AGAFZ7tUQGdPz/UWkWqvKpSqOhlWTe2/81PcGwFYyfrWsM
         faBkD2VgYrfVjWVS6qhAPMIMJpn+6p4U0FrVGPekqVaLSXmI73cJvTFIPCYBt93TMyow
         fr+N6MLFJhSc96MHhRYmU+rHfuzHZKRSSXK5UjcywQnTnz3BIoTZRTtZu0bSgQ7HqGdI
         oxtA==
X-Gm-Message-State: AOJu0Yw7T7rbfJZc0CPtZ999T9g5rL9F1ZRj4aKmS3wi8PkhWs6Tiepe
	FS1FW0QURxJWqRxhS21HoT6v2iSBidcfTAV/nmW9Ze+0RPH/F63Y/u0RYCL/DTGuYB45WeACy7q
	jfbK10US7gV66fk9KN2V+TK7+L2q13CzhMs5at+6j9ZLFqMWphF37KmzHdIsG0V/B
X-Gm-Gg: AfdE7clap/Oeiyt0hVKTwRiLcHxlDKO/JDN4LeX5mdUsjDtqPjdcivMu2A5Jpor+dxC
	pYEwbKubvxRc2/LLLmiYCFAXAHncRMXSViDel4k3cJK0WGINaKr56Z4li+KJKLGjH5m8+rOdJp6
	RWJhgkMGKNJvXFJpJEDL/608GO23L/NTEerEPGCbiAlg2dkZGPyjjUrSgi2arPfnXkZ+6LZcjMH
	MC/Rj7OF7GTT1mEapc3+pw6qYnvycbJ37D02nw8MHeWgVAgUoEv2H1HF3WbX382FtYD0tNlJsJR
	kq3wYkaGIcLweZAnBrau0lOyPy8mCIGSQvETiK1Z91ZQEplaZiqssT4lDJUbjue7O7CLXE1uFEm
	xj4FUeAGOthCQDJevkrbnI60jIQax3r4XFZC3kEpZ5ljS7uFz/1Of9BbjJNZzqgP3mA==
X-Received: by 2002:a05:620a:4453:b0:8bb:ac44:bd3c with SMTP id af79cd13be357-92ef2cb163bmr1379876185a.52.1784052487089;
        Tue, 14 Jul 2026 11:08:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4453:b0:8bb:ac44:bd3c with SMTP id af79cd13be357-92ef2cb163bmr1379868285a.52.1784052486404;
        Tue, 14 Jul 2026 11:08:06 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:08:05 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260704073000.3300099-1-miaoqing.pan@oss.qualcomm.com>
References: <20260704073000.3300099-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix ML-STA authentication
 timeout on QCC2072
Message-Id: <178405248488.4102418.9268581656192808598.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:08:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX24Q7fQ3FptQ6
 Dyr4xtw1Jf9xKbvTVlxChme/w0HBLtnUJo0dv5tmRwQ0kmw4tKtR5peQC1J9BXkY0oSQvmsa9gk
 2JN7PBr/fVApT2fj0PTLXo2pKUNuinTTttUXT81Z+Bjq6hrnKxwYY4rgsqmaVmbR6Hc+guEFvxC
 U9Rso+WxeJZrd2kWUvfCZ0srFIwcfMgs9vf6vTuo1yk63gAapBOZodNoXcbXDVnTUMvZf5Skpjy
 RdnD4V4qAb5eowDSGSd9M6i+4l7bF/X7X8Tr+CXBdQ4De6U3absQxUrV1Cf79fDWNhhRT2Gpuwn
 hNs0/wwCWP3h1og42WZjAiI6KhHSvfaxWEs7QT4PEAU49or0dGdeuT8J6v6OhcvRP9DOxhzMb2f
 qHFOjmveksAMbZzzoC4lNffPlZKg6ZZvO1RagPrMSdM5v1d0Tw2brqobp4LIzZcayeJvdehelvR
 6FRDXTUdrcm4n8b0swA==
X-Proofpoint-GUID: -12E-P2gFmwI535TH1K8b-l0B7YEgQbj
X-Proofpoint-ORIG-GUID: -12E-P2gFmwI535TH1K8b-l0B7YEgQbj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX9OQc7ic6Gm8T
 Om8eGntvEs7tO/z0sns44VsdpLmbmDaftlLMDleyO2I/omWGXss+LwgDxT6WVxFNs5n8xBkLB5u
 eocS6ViW1GpX18wN362L/lmtd3w8q6g=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a567b07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=J60ckWpfDA7ZE0iGEaUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110809_411414_BEDB319D 
X-CRM114-Status: GOOD (  11.68  )
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


On Sat, 04 Jul 2026 15:30:00 +0800, Miaoqing Pan wrote:
> QCC2072 firmware interprets the MLO_LINK_ADD and MLO_START_AS_ACTIVE
> flags to control the link state during MLO vdev start. MLO_LINK_ADD
> indicates that a link is being added, while MLO_START_AS_ACTIVE specifies
> that the link should become active during the start.
> 
> When an association link is added without setting MLO_START_AS_ACTIVE,
> the firmware may transition the link into a suspended state. In this
> case, authentication frames transmitted by the host can be dropped,
> leading to repeated authentication retries and eventual timeout,
> for example:
>   wlp1s0: send auth to <AP> (try 1/3)
>   wlp1s0: send auth to <AP> (try 2/3)
>   wlp1s0: send auth to <AP> (try 3/3)
>   wlp1s0: authentication with <AP> timed out
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix ML-STA authentication timeout on QCC2072
      commit: 3567d90721a8a51f051bcea3937febddc973e14c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


