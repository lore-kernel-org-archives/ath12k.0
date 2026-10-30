Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD07606A31C
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gzdTR7iy;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqTDMPws;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLCi64GD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9c8FC79mNw1az87e+cHhmiKEEh8DNlKxvltdbJhUyoI=; b=gzdTR7iyQDsZN0
	4iKFMR3E2RiPkNnNOEQYu3ibybwdcEKq6/M70QjCSrz33S3vmlZ34OAiPp89f7KD3JE+vdfd366m0
	YHL6crq/X9He9p3xN3oQVRb5ty9jrRZC4mxf7S8ktIi2pe4/tppzR7aJ6iZdLx3/0aBgdhpVhGDus
	qV1CTVhtPJER58XFZLf1QQ3++92AoOT4hbo2OSOU6C7g6FXMBzrW2/fH9p2SZPt1V9NXq28EDlGY4
	JscliA+NxfQIGHZuf7UedOWmc6xY+s7hwhPn3qSPgrJ9qmmqVObTNS8ObJFPXbht0AfCQTPEZE/jC
	iP4NX/V8RChv2sHa+crQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiLh-0000000BAXV-3fP4;
	Fri, 30 Oct 2026 08:52:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiLf-0000000BAWs-2ebl
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 08:52:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F90e3267891
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 08:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9c8FC79mNw1az87e+cHhmiKEEh8DNlKxvltdbJhUyoI=; b=oqTDMPwssrVKUSMu
	TMAsd0UjLfO+JYoiCLtSW/spNV6D/aRYII/HT8jCpfvlojvhBJ4OKAl49/33j+F5
	EY7HzAJ/DeLoRPW9Ou5QfEH/l27Udq7SiMjxDjEnLh8h0g/cF+PnZtCJRS5ViUWe
	qPsXWCANRpvI6n9887WKkLWQ61SoW4kGdPHfmTDSsHj7tDrTBc18uSxYZa7PiUHv
	uXqcEe+3sPHgdE/iXUYebsbxagonZ0hVa6m5AkjeCzdsquGoWfB4ip9bIC/75G6p
	TceNJ9kenRDe+4VXs3IRF2NvJOQmWPDzmoa6KF+Ar+p9uifaAUm5zEuSHfh5KXbg
	C75KHg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj3y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 08:52:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a223755e4so2315987eec.0
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793350349; x=1793955149; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9c8FC79mNw1az87e+cHhmiKEEh8DNlKxvltdbJhUyoI=;
        b=PLCi64GDOKxMbuq4am4SOIDMRG3utG9NQazNfGyw8ix8fcDe3+RlSRBn1QqZPIyYxH
         aeh4QPqXhTBEpuvZ2XXBxa3non+4Nv7wvnCM4J5AuvcH2nDibMnKhpg1WfGZYAP5CsEh
         Ewe/1VPpbBfVbhqYim68AobzCeZSNeodQlt2jaEy5QVR1ByzSczMIzjI7UMUO0J7a56m
         71QG+1umTEvWLtJt4rs9K80EpzQMVq9D/vf+BczePWLg5XOxmQzzF3fW/m9+Hkq1GWDn
         9oChRRaHQfpAdIeIwHPs0HHFys5wjsPXt0krpIrHFaMTHNJbjCIM4DnqKrejuqtYQbSO
         mCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350349; x=1793955149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9c8FC79mNw1az87e+cHhmiKEEh8DNlKxvltdbJhUyoI=;
        b=n9grWCtrfdtVkasMZmRYaE/fUtGwR2ptfBcyKAzfq38OBHXIOprWtsgWQWRj6XXEe0
         pGR+MUiKrrDI20fpF58f/Bh2t/duaVl0bvrO77Sh2K6KTo5O7x7eq/AToVa948D9BT7j
         24kUTzKKxHoTstaf68e5UyRRLJ2zZNGCgAKqcAnH7CsJtamzkt/RiA2QeGgewnp8YDf8
         5Tbc1wvH/MzrhlTdUCtZyuxq59Z23M+/oRDlmq6puaJ4oosv/qqdWHdbjWQKF6gPsMdL
         G1AaEDvLYCWr2YviXY5p0V+RA1Xaiu8CBx5rW87fersZzZPzDhkd7EtMj5nt5YLevFAX
         zANg==
X-Forwarded-Encrypted: i=1; AKwUvBzaU3jamD/upKj3mIik7+g0EV0uYtgKhtyPOQwdXJ2WCOIh+Sh3EdTRSPQ1odl+nTkHP5v1SuY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJJnrgwZUcTvETBfhgumTzRWTsSqJ1hrXTbdg0ZD7S80ga1fCnz
	s/dUXlsvpXKIIlgXnQCTnk3oZzMhFlkgtyAdrMmOQSNr172bVYTR81NHKzrPJCRYLvAJphv13ka
	yJfta3XRw7DxH7hTA1Uhn3nNQha9YRd+HdNiD/2Hw+Fp7QClQiQkyT0thrZiVxZor8qQZgFu+
X-Gm-Gg: AYBFou1oi2SfjE/16A4Y6G1XBoJo0mYX43/dtTvx0TtVN3TFLfdFfyG3Ev8mNohNsPV
	z/6c3HpT0eKt9AqrHXhx6lGYx1Q804Zu85c45HFWJHmqw5+8UrCkjUkBUaq6EnW/sKKTpUhcvaC
	fkV4Uqwo1TlW3bS36WAQwVIcneohe4KCkStKgEmzftZCBzL8FIWyqepeXR/gR8pYFoA7l6BMVXu
	m6RpYim2He5Wm5BpytBabwJZ+uaKXAl3qAsvQ+P1FdLJzqUioIURt5x2fhJ2F1ppJ9KCd0HgSaD
	3gvU9UjHMVCojdGvz7KXbl7ewOt1xKRzTR9DfVr+o+HVn8I4jvL3qRiGSqPx1qpC09OELw50uZt
	+x+LHJeDLaP2HtA0PeYw9lPLDn4xsZFO+bx/Jzk8xJXCkqFKmkGHCMxHj0onNk4wvPehCukP3VD
	5Ge/x3L3C0VJ2nH5XXTujj
X-Received: by 2002:a05:7022:3c81:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1ac5bbb4858mr2126250c88.13.1793350348844;
        Fri, 30 Oct 2026 01:52:28 -0700 (PDT)
X-Received: by 2002:a05:7022:3c81:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1ac5bbb4858mr2126219c88.13.1793350348187;
        Fri, 30 Oct 2026 01:52:28 -0700 (PDT)
Received: from [10.152.221.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm5157429c88.14.2026.10.30.01.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:52:27 -0700 (PDT)
Message-ID: <e197c34a-9cbd-42d0-b2b2-878b4f37520c@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:22:23 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: don't advertise EHT-MCS15 to
 firmware unless we support it
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Vladimir Petrzhikovskii <vladimir@dfb.sh>
References: <20261029-ath12k-mcs15-v1-1-3bcfab101f00@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261029-ath12k-mcs15-v1-1-3bcfab101f00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNSBTYWx0ZWRfX0452v4jwMmIY
 5a7l3TnaaygpBFkfsV37ycb/CZZ5DlotNsWdSKi1Fke2ch+vQdr2BS6PdeWKwiy9zEBUpd5BaCa
 0otOKh3+u4Qk/xKrIszOf9azffiBevJKlQAToKxIAe+rjHqu682Xc9F01K7FTR0WANo75f3Guj6
 5/R4HiKpg5omRY5O3M3lLt5d5HbEjV41HgcTJ7dbwQq5J7sRftWYFL9zriP7vPLttQdaDyupsF2
 +UTPWEy3yu1bGIwfxG9p5yKA0pvqLECMpeNOr5jHIi2yAO/wU4eDLvPjb5mzjtVzPmapdt8KhB5
 AZRPJAPvILHKXNCQWsBvTQRjxFre0ADSczE1oXlf2+/R+pPnhQXpXdc5/URjnH/hrJhoCN1Mei3
 rKiB0DwMR4CBUW3XqX0/jgx3Ou2OMPqnSbXO1ohJ85FVP8gb0bbLP9jLpiYD2/3Jp65DKIJcjYy
 yxkFjuMHPoyakMxw/EA==
X-Proofpoint-ORIG-GUID: 00Uw37u9-PMArQaMs1WCS509uEFOJpDU
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae45acd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KICNIvf8-xFwCwObymsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNSBTYWx0ZWRfX7UhDnHSqJLra
 Fni/11yIaAdx05JJ9wxNNqSBzNEyLELcOXL0A/m79lS8NaP/knISc/NZO4y3ECHm7//OMwW4ut2
 R85j+ouTIlUH+yjmNmUaDoBl/9zlNrU=
X-Proofpoint-GUID: 00Uw37u9-PMArQaMs1WCS509uEFOJpDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_015231_790329_DBD45816 
X-CRM114-Status: GOOD (  13.12  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29-10-2026 07:48, Baochen Qiang wrote:
> ath12k_peer_assoc_h_eht() copies the peer's EHT PHY capabilities into
> the WMI peer assoc command as is, including the EHT-MCS15 support bits.
> Firmware rate control enables EHT-MCS15 for TX whenever those bits are
> set, without checking whether the local PHY supports MCS15.
> 
> Currently WCN7850 firmware does not support EHT-MCS15 for TX and does
> not advertise it in its own EHT PHY capabilities. When connected to an
> AP that advertises MCS15 support, rate control may still select
> EHT-MCS15, and every PPDU at that rate is aborted by the PHY before it
> goes on the air. TX then stops for minutes while the association stays
> up, and frames sit in the queue until the firmware releases them as aged.
> 
> Keep only the peer's MCS15 support bits that we also support ourselves
> to fix it. Chips that support MCS15 are not affected.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 17bbb8aa74fd ("wifi: ath12k: prepare EHT peer assoc parameters")
> Reported-by: Vladimir Petrzhikovskii <vladimir@dfb.sh>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222136
> Tested-by: Vladimir Petrzhikovskii <vladimir@dfb.sh>
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

