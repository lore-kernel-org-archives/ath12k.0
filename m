Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE282CAC5BB
	for <ath12k@archiver.kernel.org>; Wed,  8 Oct 2025 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SjNOmBYkgmQ4w218km+CPYe5MEFlAVFtIXfYnTSkI4=; b=ENX/lKLFVFliMcTDVKMyAsI8N+
	GKQq3WNvOFShFxUiVAAwpoQVXn4V8m2gU+2Jf+DxjEgJx0zoDEjjuB1ksD9ZWMtHLqa+eU+Blba3n
	TCRnhpPMJtRbig++q95WomvQLgU2FA6Z/lzgMHrBY9B95/sRxJo/3Zm2SDTeRT/OEaIXMtW4E+BDV
	7t6w9TamHSASMdwSoZx/a3HSHUaahBsMnE+KgoB3Rf9vXy4GdAVGla3GZsMb9aSNJuu1lDovoAllh
	8zFqLV6VxSlDQJplLbZwlXCV+jNFmHTPJmlD7wm6WG9iD/UlfIh2mLxWwOZFMTP4IjtNkiMRF1Kym
	kL3Z9NuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WjO-00000004Ghj-1yUq;
	Wed, 08 Oct 2025 16:09:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WjK-00000004Gfy-2bjY
	for ath12k@lists.infradead.org;
	Wed, 08 Oct 2025 16:09:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Rbb001683
	for <ath12k@lists.infradead.org>; Wed, 8 Oct 2025 16:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SjNOmBYkgmQ4w218km+CPYe5MEFlAVFtIXfYnTSkI4=; b=NYYhrOhSr8+/V/wN
	mCrm98SqJlQE3wnZ4aSfbXipocoNNbFitASkoM4ij8OO1g3/EKjiUtz6bLIoMOsX
	v8Uz82Y3gbyo1kqlEqxncpnaXknpoWWqVhSs9/CDgJQfcZBk88kQH/40KT9bJYdw
	3sEpHSQRO3vmNsm1A8ABBAw478RxIlnf4fNMDEhCyXjARsPNBwDrVA73JpCKWqeN
	wnQ2vZaIWNWYJRIYBW4tx5pe3FpD3y2r03FlTiAj+IL6LjioJnpGgyL/8fazkfPY
	k485sJ8TzQAda+olZV0ggo4p6QcMqAwp273bg2xD6jtushHlYOlOp1zDdGdHtEr/
	0ypBcg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnbggm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 16:09:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78427dae77eso6741264b3a.3
        for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 09:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939768; x=1760544568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SjNOmBYkgmQ4w218km+CPYe5MEFlAVFtIXfYnTSkI4=;
        b=OCEtP0+jVW/dPSSlquAuIEAo4IEd/Dmc5cD0JBCubyh3xP8358X5rL74iX2RKpefD/
         /zZZWDDL5d1DsO0/OXiIlefbAos8BL69X58xj3/aE8m8zOuZDZ2+IkMnb753XO2yvivf
         4VQ6nevEGNU4RqWuBbb+phL5DnjwFLUQ2eUqVG93KMWQo2WuGnyJVGpztyVVEson/UPM
         eb+w2f6VzEhwo01/xe0Qss8yOYuf6QOygamQWHPNv/yawsWWOX78Q9Dn28d/9xOAEaEv
         Httd5IB3Z/LucKyBKeEV+XFf7ybmd0+yQCiC+ILD31qlxYO0NZex5ee893gmWKS/sKWI
         1ovQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/mpL8FN9Ks5+hkx7dWff0njMM7va/dnFrFktRekoz9+cY370kG+I4GuM6TWnWP1eS7J6ZaLU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCuKG0JGs5b8uICaGbcIPo49qG4oo8BhQDivtiaDoRaA8ZygB9
	aW4JdNl2MY4ch0feeuBpcn/NpCtdOu6sg6TKlD12IEsk6YWyTzQHC6OxIR2eseaCf/Fres+NplF
	qjcOtEKiQaYPXGSemSMl+YiNO7tGW1LtlBqMnGrybHeEAbX0iINefZ6ORHXcAlfdl
X-Gm-Gg: ASbGncsPFTMGOA6kC2mPXepgtYvfpDGf31POfhqI4RZnAvUCzI+sd4ZPeEhxcFZ06TB
	QY6utVpjwQ9IjkZFpwRjKV13aj+ggoB+N8UMU/4h209CT8c9fquzLixX+YgNIgm3xUTzoERSnyl
	f/a9inoGnkT8UHTul939X7ET0N5zf8+5PyMNPY6+5C55E6Pb3bZm37NKlFeHSITDPHz8/BROajk
	55syP0mcqklbUsCGK7XB+T/3QO+aL7HXDS2RZUnMzYRhJhc4RM2FTnnD01tX4ptpaqR57FoRfy1
	KapKf6pyj4MUdh23ByNfA5YkDHQD8guFmzJ1Bq3GzzlYjUXntdt1CJOyXUUYXvEa4ID12zq2FMr
	tZNDULAVpyaduAFiu4pSxng==
X-Received: by 2002:a05:6a21:6da9:b0:262:d303:38ab with SMTP id adf61e73a8af0-32da839f896mr5751526637.33.1759939768052;
        Wed, 08 Oct 2025 09:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwSYhZX4V4TmEwCuDMwX6Kq+U1LCW3VSwEhMXEfdqhJXPuvkVj+O+uuSORendAHkxiUu8ehg==
X-Received: by 2002:a05:6a21:6da9:b0:262:d303:38ab with SMTP id adf61e73a8af0-32da839f896mr5751472637.33.1759939767494;
        Wed, 08 Oct 2025 09:09:27 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.106.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d510e3fasm148113b3a.26.2025.10.08.09.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 09:09:27 -0700 (PDT)
Message-ID: <fb9ca418-4df3-ba1e-9fce-9353c2a28136@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 21:39:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Defer vdev bring-up until CSA
 finalize to avoid stale beacon
Content-Language: en-US
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250924134336.888-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250924134336.888-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX5Dyuwc76SYYR
 fEdnEQIPtJYur+pehNLG1xGxguOgxRGHhs4w1GjVZC2IaP0Lc6HOnm8vEPfl5p64O3Pj9w8NOBf
 JR17AznR/lN/ezkQ3Bh8BkTlXcL5JyBPc7EArtirJeEoy+jVW6PE6+QWFz7zDkVF9LHfj/gYP+i
 asNWc1s7qzdfpp0OAo08rx7+XxiGalV3cW816lcc/Cl3StOGjBiOQbICIpIIPnRNsJXjLF/aHf7
 4vEcfZ/SxInzHDqWdzDRwrnx483ntHHxChbi9rTDyy7a48eiuEWxP+UNaU99psO96XsQch64YYd
 r6lPyFbs6XcHQH41z+spTCr+7ANczByEsShSySPwcLVOn0z3QkSWWtSz40f5WUI+pq7e+wcqaAq
 peUIahCN7U5AhWFtxcbqkcHucWaBqQ==
X-Proofpoint-GUID: 05peOzDqPvVFbZQo-0TfI-3ATu6DkmcO
X-Proofpoint-ORIG-GUID: 05peOzDqPvVFbZQo-0TfI-3ATu6DkmcO
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e68cb9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=z6xreaRxtU16OQ9bEhv1vw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=BueIPD__e_aKeFq9xe4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_090930_780890_17567932 
X-CRM114-Status: GOOD (  16.74  )
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



On 9/24/2025 7:13 PM, Maharaja Kennadyrajan wrote:
> From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 
> Mac80211 schedules CSA finalize work twice during a channel switch: first
> during the reserved switch phase and again during the finalize phase.
> The beacon content is updated only during the second schedule, which occurs
> after the reserved switch completes. However, the ath12k driver attempts to
> bring up the VDEV during the channel switch callback
> (ath12k_mac_update_vif_chan()), which leads to premature installation of
> stale beacon templates before the updated content is available.
> 
> This premature VDEV bring-up causes outdated beacon information to be
> broadcast, which can result in updated channel parameters during the
> transition. In MBSSID scenarios, this behavior is particularly problematic
> because the transmitting interface's beacon must be updated before
> non-transmitting interfaces are brought up. Failing to do so can lead to
> beacon mismatches across interfaces.
> 
> Introduce a is_csa_in_progress flag to defer VDEV_UP until CSA finalize is
> complete. Set this flag during the channel switch callback when CSA is
> active. In bss_info_changed(), check this flag and issue VDEV_UP only
> after the beacon template has been updated.
> 
> Ensure that in MBSSID cases, the transmitting interface is brought up
> first, followed by all non-transmitting interfaces. This ordering makes
> sure correct beacon propagation and avoids stale beacon installation
> during CSA transitions.
> 
> Additionally, move the call to ath12k_mac_update_peer_puncturing_width()
> before VDEV bring-up during CSA handling. This ensures that the puncturing
> bitmap and bandwidth settings are applied before the VDEV is brought up.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 8c6faa56bfb2 ("wifi: ath12k: add MBSSID beacon support")
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

