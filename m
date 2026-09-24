Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD7EC98324
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aY9BlFyfWfGA8HiZfc5xvC49012CpHRWxFdQ71yO6ng=; b=WbOBfoDBegquPDtJo1ry7Ew0Az
	QqsSEA01Qs8OGVpUUsd7t4bbcgoZ7oORowIAAXKOdkNPxCZYcoJjeFZo/LsqjMEwET2c8tnwUuEnw
	tkNcF1H+HwJ+0EcVJI5+cIIgvswQCCo4yknDT+Jd4/4FpbVmZapqK8NouBWMl/iqnqqKv53+ZkhCl
	qSWUF9mZ1+Oxq4471xZal484FbC/OND/FCifYDmT+grMYytZ2V73p1ksA7qYt2ktaIlhNDpqxaKSR
	h8TO6tU8bEnLvci5QzAX7XQvyjnqfr8/Y71SKQMvlsC5q73HeJniCutRYcjiOcREM40rmqR6k9j8F
	mpFzLrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lPg-0000000BQsf-3O4v;
	Thu, 24 Sep 2026 15:31:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lPf-0000000BQqR-0cHP
	for ath12k@bombadil.infradead.org;
	Thu, 24 Sep 2026 15:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aY9BlFyfWfGA8HiZfc5xvC49012CpHRWxFdQ71yO6ng=; b=UOWFCuOyHDfJRPp0wHuSI/lINE
	VggM0Qng15R/ZI5jyJIdA9ZPzsITa0AUuK2UuSepvsu8WlGM31GOPAEWtDuUpkr9oZ9G6/rU9OPFK
	ZWhsaPFlOUO8g/P6vTbYflOZ7GUVk/ABUe/z/rzp+/g3Q1yY1H5j/je/jM4bWakZ/Ka5gRFVVT6vZ
	Iaj8O+TQVPwnJ/men4tCq/0V68PgWTpGer1lWDgeIEd3dLwalQ63xsVMV1ryAc+fmt3rzHyVg0a7Y
	um8i8ydincab27moCmAtLd6bH5gVg+71Za9CtQjOxJR/G6VRUfFvYh3xYSnfpex+Yb7ru1UTUZQKF
	mfFH1Rfg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9lPb-0000000G8iE-3VRh
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 15:31:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4gjn2594260
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 15:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aY9BlFyfWfGA8HiZfc5xvC49012CpHRWxFdQ71yO6ng=; b=Blwpb5SIlHNB5zh9
	Q4nhjw3DeFgNXgqZA9LK9Oa+W3DcTNfo8XMasKZ9inJqXBsRztQztFID/OS5XwkJ
	ILTfTXD7vXjo+DmKy0WhS+dBMhm7MZPyjnhpCf1LmINkFOYBAoaccqjLKMhuvKqc
	6sLTZXP7rrpSj0lDSHbmS1uyIeqKNVZobf+GqZpeYcspsGxbE4NMx3N7VBUjiaB8
	MDDqC5PIQx2s+x7sNR2oCXthcfuCcupuq6W69V6WP0vYwFIs+3zzZkbaagmWB3yh
	tVpNvxU4TlgyGtBetKPtRiqlt+d7XaavCN+le9VVWBdLpxoyX9j3TSte5RYxFxqw
	tt++VA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjh9ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 15:30:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so19890595ad.0
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790263858; x=1790868658; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aY9BlFyfWfGA8HiZfc5xvC49012CpHRWxFdQ71yO6ng=;
        b=GbvPBfb4EtyV+bzV/SteDQnGjGUeQSdAprWAZyft2gPgcRDEZmuC1hgRUgxYZFzpGd
         yCYG0BpRoUvqtCfjHiJVgh96YDurvfSnRrT2pl/PiPjXI3WUaN57rc4ftf4wrEoj0QXN
         PFfxYLQ13BtY2iGV6vjHaQ4SJ8e31Gt4ggmTzfXrZccThAXoyP9c8rBWx1RdBq5DyrNe
         Db1t0+PV9hD2zRrZnCFYazH6DgYmEPPCdnp04gPxFqKwru+jAl5LKUrS+bk+nEce6HVa
         GXs8B5efkUVMFZRq0t9A3XipVzOHiU4arK5qFPso/u+Thc2cJSntkdI1uk2kgt4ixnaz
         BDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263858; x=1790868658;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aY9BlFyfWfGA8HiZfc5xvC49012CpHRWxFdQ71yO6ng=;
        b=H6gxg6/WPz92h6dSAulVOloCOiOfJo7kNnDif5deZhTUNC31gJo5ZGDdz6Uy0JJwVH
         KYa1pfLKPJHkZ4/wiIDqSJHu3KqDa8nPDR+AT23UPmomZMwVnJqcrJyLDOy0bZfL8om0
         0pNO1tXeHmZkD6ILjiLuGKNHt55j6F4jezHm9/WL9SOoRJ0j53m/jJqMGHRnG84c1J92
         ud4liXdK0ZMzCLnKYuJhff5RcdhJpojvE31RKolkCqEcd1aZ3aa2QUTBY5O9PWqg+zjl
         mrpMkq61NmtNcLGIBRu8phHMw4r+ix2tP07nxjBtV4p74NAuu3Y4pctS6Wr0bHgIboRU
         OcPA==
X-Forwarded-Encrypted: i=1; AKwUvBwHLJqxH+tJ75WNwg2Fi7DxycMKtHp8UHzEhfxrjW9r5lc5NQF/me140zjC0JvxYZaQwpKpERQ=@lists.infradead.org
X-Gm-Message-State: AFuF++mnY9V3EIJtfq28zPWL1x6eT2iNcLlEGdKgXxPPF3K3X43d52Sg
	3Cj9jNAFDfgqox5ZkBxJEFx/Cu43xbLhM0A1jHx8gP7s6H6DCfWDYEQua+hHijtLk7k/DOWm9B7
	fk+1KVNseNfwD8eEHHspcIPwv0dsc1d9X6e4cEv7vB4EoXgNmxu6INtW0DLIkFfYK
X-Gm-Gg: AYBFou2wL94iAQveO+0AvAwxYEaDnvKSFUUHGQXInB/BiHHuTgewl+rKKP5D9FIfox+
	0VNpPO69KIG1L+lDmS3NniN1iio/nqK03ueks1iTywqSuEqU3ddj3pSTBxBJBoSNKeELWkwbMRl
	T9ar3wtcQqm81VudPgLL1pZK910Tl3BZFUBAeGwOIK3UsuGr64CP7/sNHvYBAg1pXDoPSqNN8GN
	v1jBOg1WAlqy34jC+aBNRErXjHSYmccgNEYDlq0oR3lx7az67n98bbGJANp7U088oa0BMH6KPgy
	p+VtQnpwTPc892vwOSbbIvd+FHT/E0ez3fcrRbDghNZsag2DQIsS86jKhv8aJxXakXTPbupBaD1
	FOakWV2GOEmaWATTUpvyFgDfVT+AgvWawA5NutciDdIESiZ7iP6vxRPsn5w==
X-Received: by 2002:a17:903:19c8:b0:2dd:ad74:ac27 with SMTP id d9443c01a7336-2df7e39a0a2mr23958305ad.25.1790263857477;
        Thu, 24 Sep 2026 08:30:57 -0700 (PDT)
X-Received: by 2002:a17:903:19c8:b0:2dd:ad74:ac27 with SMTP id d9443c01a7336-2df7e39a0a2mr23957755ad.25.1790263856817;
        Thu, 24 Sep 2026 08:30:56 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5de5c8sm29772105ad.60.2026.09.24.08.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:30:56 -0700 (PDT)
Message-ID: <8e027ef0-6956-4766-9ba1-55963bb6c537@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:30:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 4/8] wifi: ath12k: add device DP stats reset
 support via debugfs
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
 <20260819053247.1420393-5-pardeep.kaur@oss.qualcomm.com>
 <435e3012-9b6e-4327-97cc-f65ed1e0e5c0@oss.qualcomm.com>
 <30303e94-f0a3-4e91-8690-006fea92dff4@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <30303e94-f0a3-4e91-8690-006fea92dff4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ux-jBVgqDv4UcQLAiM55WwQ_cPmX83ry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX6hWyD9M9fGEA
 YT6Ef2CySeiqQJVn/h36oN1tTcX5yLQJxjulCN55nEszMrVNvbvq9YtRMg/0jCU0Wzs81xSmK8N
 SLzwCBUpnisaOvT1Iac7f7sACD783SqWdE7t4H3sKC4LnycfLZVv31sqiZmW6lr6kE7YF0t3Yh+
 9S9ymM4+QzJMcxfGunSKePBfR+KoH8AevPXBacXOejMSh4hUlAM1tsdfw/8r2HMjZWSoonLfUJu
 7FreGSzgaBJVU4gXBHpvhLAs05CaQ2IBpqk6KIlT4OqhReelwuvHUfJ/Q5BrQaN5BTw/obfBvSb
 TyoiYgWCi+w+LatLPbf5fIefqyMwdC4JdRfvjj0IpUIisuK9N+2tPKQ89uAXUNqoW+Klop5z1TV
 0G/wI346Toz31dYcYIsNED+UqTOfQCqQcXO9Xf9KPmMG7gSvgMZbhG12UUqxwxdodSlQrGy7j+C
 mUhJ+k/oMvij21b9jFw==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab54232 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1IDsVKZWqnER_imYb_IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Ux-jBVgqDv4UcQLAiM55WwQ_cPmX83ry
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX/LwUhVVDJQGW
 nXM2VKRamrFc49vtQAxijKsv91lShZrOpli021lXE8bV901eGCmJSDiBxg4qCe0NnzEhXnCqe3k
 8aEeuD1xd9w3kDVZtlE7N/j/MVRr9+E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_163104_226947_CE66022B 
X-CRM114-Status: GOOD (  10.63  )
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

On 9/24/2026 12:55 AM, Pardeep Kaur wrote:
> On 23-09-2026 05:42, Jeff Johnson wrote:
>> On 8/18/2026 10:32 PM, Pardeep Kaur wrote:
>>> From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
>>> Add a write handler to the device_dp_stats debugfs file so that
>>> writing 'reset' clears all device DP stats counters. Change the file
>>> mode from 0400 to 0600 to allow write access. Use
>>> simple_write_to_buffer() to correctly handle partial writes and
>>> non-zero ppos, consistent with ath12k_write_simulate_fw_crash() in
>> in what? the last sentence seems to be truncated. Or perhaps just s/ in$/./?
>> if there are no other comments in the thread there is no need to repost just
>> for this. Instead just let me know what text you really want here.
> debugfs.c.

since this patch is already modifying debugfs.c, I did s/ in/./ in my pending
branch:

non-zero ppos, consistent with ath12k_write_simulate_fw_crash().

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=3bd2457570ab0a4ca5e7e354e7b6d8703ece6c93


