Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634C1C87FD3
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ldco9VGV9/AxZ9ihFqepHt5ZP+skAMv8MaOKmwqgkMY=; b=3+0cs+ILQNttxkF1y6B3agyokg
	EWJlcDLn9ru8IAzlHWX7dSX5qcwOL/WlFm60j6B2L3DCDAXayXfSxO4iriEKhIftH9UEq2ZpXX7Mh
	zyDcAK6sUat/Ez7rNmjpc+oiiGCRkXiFEKz92FHPcGmaOTC8QmxN67SWH8O5h4OID0CUhk6OIhQIX
	top1CcMJouQR10O5RM+yKCnZnzMAPLNZ5L5M1yVgnknVVrGlOSXl1nLm9gL82mZnhgm0iAT2zFE/7
	hAPPnGI5Zk1NnCsZud0BZvJ/2wPZzCdsRf7RxXXNEukPOgDyfguu6bi4Un89wHEijEPs+PdrAAV/b
	St1ub/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeup-0000000FPug-0WyQ;
	Wed, 06 Aug 2025 14:14:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeqJ-0000000FP9K-09Qy
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 14:10:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576D83G8005170
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 14:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ldco9VGV9/AxZ9ihFqepHt5ZP+skAMv8MaOKmwqgkMY=; b=ITE5Y9ZXXc/DJ76K
	3Rp5c0p0XYo+oAMvxIZY/+eSbFr+jtrMEtov+lLHTI5qhBOssoRTHcl1airMQ82R
	pIdDtsaljKPwe1ng7qLZah1sKjBcFXMfL22PzATs09vG4B+LEkvoRN1TrBSU8+Pd
	rZfnQI5auazkvN96ABL8lrOkdTpbFlle1IdvLt+TolHMIPG/5Pd3fAzEhcd3Ts/f
	KToCEYAb6pYslMzfwUzRzSZAP6DlGggazwy+5YEULtWchNxSq1oVPoFMMzrJBQ0x
	14f795WBQW//Q0PPWM28+I1+clbuUoajU8k3d4AWxGrA6rm0YaijfAC5Am18QH4T
	geKVoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyaawns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 14:10:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-75e28bcec3bso10184636b3a.1
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 07:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489410; x=1755094210;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldco9VGV9/AxZ9ihFqepHt5ZP+skAMv8MaOKmwqgkMY=;
        b=qG/oUgGBpnxmT5O/Lvhd7gLuA0jtOQCajCKyuYAK1S9yt/TdO4dqAf4Sx7yfCsY73R
         C8I5bsHIlsqbbertQyKwscqUtshnY46yk05UrokOtClQFmQqUzEgyLzMqpJ+qIURhsts
         JDPddS6sfQDsdRlwZNG/7xWqgHbHPsfHgzRWlDCjn7bgGdLa1oWS6aUK9mRsoSfzkZYV
         bmo9djA6Ls49NQ+54xv3eF6/EdV59oxZ1d1RQtALnXBbjaaxMHeRMpKkycVu0AS2ucVT
         e8w5TIHzA1MSUSHwZbSwcfajL5AgajKBTfqlTlu5dikyFvI3o7GB8/s7lAw1Vjg2rQt8
         8zAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPmAkJqyOTUYdGELGGBbmDhzAvt4U0vqaIo/Bspr31Gqf4iASdOCpIeOiJClrA/uHqLF6hMa4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv2NsByVkAZUY0C9Dd+VlWHMjAOdLvTWo/N20m70Q4xVI8s7mU
	Wf9JQs5FGgOtCsP8HreZ+8rUqQbnt9f9qev11Dg6vYyTsean+e/iIuUybqHqAYzSNWW8DflH+ka
	9aMuKMryCwPtWzzRnucLnDhMEmhSTeZj8/3cB9Z46xCpJ0YtN5Q6OtRY4exh6vHsm
X-Gm-Gg: ASbGncsDvCHMIIblwOglRWCEtlzcuGYkh2Je7tqSfiiA0hTW89dC9bzFkSFkiCf+glB
	eC4+LfC9TTEKTiPlJPghnZNpTYszvf9mgXu/biW+2A4nciVFtsXtCUWmvULqY0GGAbmPq9Lr3T7
	r9ZoW4yXe0OyZqOuVLn+bAguA3P0jQ+ZVQh1E5SICyPwsPkEtAaFp65VOpQCHxFsdYgOWsx6r+L
	mnvE2V8JXnfNnSpNa+huVrTQzS2LzvH7LxZkOxnAAo1jBJaghHJRJlAhZjQJn8ik03kXuBu2/c3
	k3F3NKLQCjNQ9n9oX4KKV86XgqFiiBkLw+8Ufe90OHzIThexiZclSmw+7Od4HusWbqcvVV1asGM
	aMj0CycdhmxN3Pflla7c=
X-Received: by 2002:a05:6a00:1817:b0:76b:d8f7:d30b with SMTP id d2e1a72fcca58-76c2af7aa3cmr3018000b3a.10.1754489409753;
        Wed, 06 Aug 2025 07:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzNrhBL2zIZz8t0xkLTHT+9snFgYHpKK06KmLuKGgNauWXMLuf5Ab8TLJ1Q2uACzyQ4tSNSg==
X-Received: by 2002:a05:6a00:1817:b0:76b:d8f7:d30b with SMTP id d2e1a72fcca58-76c2af7aa3cmr3017955b3a.10.1754489409247;
        Wed, 06 Aug 2025 07:10:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd05dsm15434414b3a.81.2025.08.06.07.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:10:08 -0700 (PDT)
Message-ID: <81440d36-9729-4eb5-aa30-d94d0f85b7a1@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 07:10:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fix 2 instances of Smatch
 warnings
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6QKFVE9hnJPYcvtPLwe8dU6S-7aF3YLm
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68936242 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BoDogKCtvrOBLCu30DUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzjfH6XSVrhi5
 TZc+IaIvLxdZpsvFg30l5Tf1IxDVByYKNXlWyF95DD2+7e7WtTvDqiyCErE2+g18iUQ6KIhGgF0
 4VFpn00iFVE4SCKjs5cxpynunrrX23GMkHRVivgG25EFwbYlyQXJyOm6hiMk4YhJ19BdVfiMlv5
 Qsl9fni2HYRftICgb9hORB20Vv1D1VOS0vkSQtY65FHsyLmhXoL/ECa0tSdHvgshY84+RaJo4r/
 syACqxm7CPdtBVsjRYJA1Hy43yrtNKz8M/NxON3biI3U1JDO37xUMZ84byBVbI9I6AY2RyzA/kc
 R8G+tOCJ0gvkU8CS3Bqxc1o1TuCrfxGIEMobLxuBAQ4fzhwlvmhZTtq+Y5SOVjM25mZih+911T0
 oiS5Lu9s
X-Proofpoint-GUID: 6QKFVE9hnJPYcvtPLwe8dU6S-7aF3YLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_071011_094235_DFAACBC5 
X-CRM114-Status: GOOD (  10.86  )
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

On 8/3/2025 8:03 PM, Baochen Qiang wrote:
> Fix below two Smatch warnings:
> 
> 1#
> drivers/net/wireless/ath/ath12k/mac.c:10069
> ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.
> 
> 2#
> drivers/net/wireless/ath/ath12k/mac.c:9812
> ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:9812
> ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Baochen Qiang (2):
>       wifi: ath12k: initialize eirp_power before use
>       wifi: ath12k: fix overflow warning on num_pwr_levels
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Since this is fixing smatch issues I plan on taking this through ath-current
instead of ath-next.

/jeff

