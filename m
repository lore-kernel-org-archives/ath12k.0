Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D58C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXAJ3dbiQ9FQdSrTuK4dIfmh7nCFrqDUavEQf1GJa/E=; b=Lx6X47v79EWfSaOBAU7RQzVT0X
	Qv/sFr4IW4Kyym+GiGjXJq1D/T2F+hEwTywZ0fbH+5Cckzbk+4eN6hpMrN0Od1xskAkeA+x6b1WpH
	1M8KwH8uue/b/9y5cafi1xMl8q9t8sbyOFJU0YY/FAn4Mw8ifljJNNRKOrNne/gg0dkxnk4tVFgJC
	S22S+WrYaKAvWMXp/v8RZxf2smdGahjo4l178pRMWTCTQ0nc9bs/aCls/oI5C+UBNASZDOyxqQkUT
	2FkB8T48MuHtLrVEY3DtM+ySGsM/5js5cfAnqcgX9Ry69EyyoIzz7WgXRnMicTV2mVwaD0Ye/C0Vj
	rPS8exgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjChu-00000008gBQ-3PhJ;
	Mon, 13 Jul 2026 09:12:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjChs-00000008gAV-3alv
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nu4e568071
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 09:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXAJ3dbiQ9FQdSrTuK4dIfmh7nCFrqDUavEQf1GJa/E=; b=EI1KbGmq0fg3v1iR
	IxM0nLDXiR4eSUqwwS7QwIpIHvYhOWxI+ypkNyLVVFXlcHhoULTY7mra5ZewDQ4O
	uY+Bq1jgg0CpGjrAQkyKlnlZzcO9xX3g25t2j5/utoiA1LZUAw/pDnUDUOaOsrqX
	lx+VhN6zE42FTp4NVgD5oDr4iBCf5LcYb52+bnxKm/+OT1yIpIBM8Ux7OMPabB1j
	KFO3vA3W+/WUloNbtp3k/6duMIZHkKnsvHT0/Y3+bnPesBqKpmosqFxG5qZOWtme
	IiX5zjGoYzUpjik+rY4TfCKpGLYgwDRb4pzZIpbjXSzl1tN+fVLYvZF/NEd0jNf+
	VXUKXg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe915bya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 09:12:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3646335a91.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933927; x=1784538727; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXAJ3dbiQ9FQdSrTuK4dIfmh7nCFrqDUavEQf1GJa/E=;
        b=D5BC7ATI998B6ylGryYVCpy57GS1a+FvfSCIsW/sRtAmbObTxZgpkiC1N+WCo07f76
         OKuRWl7N+B5lFw05ipyzGEuDvMtm0gqPKRHC6xMzXnk+OLshnfE+TLNIrhcjHuC55JS8
         XAbc5nH3bb4f+VL8pqwSfa4vN8OK0rDYwwhEzu4xVzB+Qp52fXpY6+e3msThsRVNEzRE
         t9uPd69n0FAABaA6+jBdIggS/UNs4U0GhVvfBbw8I+N8daoYbkBlQt3EcQZ1TZ1VkRzM
         T9veKAgcgZQH7UHjJROmzLFVS6/JS2avF6rNHMjZh8itzEMVTHftzJ7CGLd3K68sIpmT
         MtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933927; x=1784538727;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXAJ3dbiQ9FQdSrTuK4dIfmh7nCFrqDUavEQf1GJa/E=;
        b=YYEGt6sCtnL00je3X3E63/yIgzo5lDAXNLrBcpzFqDTHcJKqPJZpxo8RK8UpyJmtpo
         Rq3p/4qf0rCTNw1SR/pLnSpLjy6gHEG2+g3zIaMXx64Al994cF2ThEkNHN1wCBYzdw0q
         OhedtXW7hJpjgvuFHWEt62mUmIDmhJXKyyR4nANzAtuVjDoq/YlObTVdG1kwNifJjaFx
         VTQlDiMR3A2y+s9qKs5M/mVr9IK4It94A6J7SOxx+fhvP/qBtxdd5hIK8plD0KWmoO2q
         CnjU+YCHUOfqne7mMN5gSZfxzhaqAr/Yl+HYgYURPn9RFB5Lr5Z+H07Fcqqpl1FQXbat
         MY7A==
X-Forwarded-Encrypted: i=1; AHgh+RqfImrW60J7Y7PyOqUqE25iUXOgF9Ls36wGaImetNISW+tGGEfRxynHDzgrM07/UbkqtcdMouU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+cArYA4OvDvcZJD1wNWAHAooxC2reAJoPE6jUAo+8p+Z1ZUUi
	6fAkSm5C/b7M5Jdzj7TARx6iTCcDJfS8u3xu1qfWD5UY5/kbavfx38TdTqWOk4ly9WLTvA2bJlT
	diBscoz0YL9IU897RWUElq6kFDSARdRmn4AHuPiS93Pes+gK6xuJjSWg6Tu57P9Qd
X-Gm-Gg: AfdE7ckNUjFfpN1FdBfWl+zDg+eiuPD9j8D7L5jcHXZR1NGnlS7+EkVF/+7U6/L+ze0
	UccuLlNqvIRfTf8v2b5o/5EGRW085GweIgViTtBRPD9JgroWkIX5fdNbqJBdJb9THdNr5ChWT9i
	r8E9T4WxgiTXemFGvIHEhVK9SaOrmqOZWyiOfkC/oaIO5nBgkFH+m6nEZBO4Pwe/e/6nCUruFht
	HKDfuLcAqYaeObz7QrNDwZ2e38vkRr61RyXW7sfRV6RPzeLfsZLzZqVlL9XIqhbAXW3qbMq9PFo
	fohCpsTgEUDuuY0lzh7mMBLN916GSRtzEKb7FJ6C2AIT7WOGl+H1Ngg6Pd7yrWpyk3mzSUNYLEP
	vF4HnaGsNAJQoxTj9F/MURbbp6aTwWTK9gPJFXAKunYB+aMtTC/E=
X-Received: by 2002:a17:90b:4c89:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38dc77c6b26mr8078870a91.40.1783933926720;
        Mon, 13 Jul 2026 02:12:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4c89:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38dc77c6b26mr8078847a91.40.1783933926280;
        Mon, 13 Jul 2026 02:12:06 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm74258036eec.0.2026.07.13.02.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:12:05 -0700 (PDT)
Message-ID: <75c4d7f6-0252-4438-b3fd-cbca81b1a189@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:42:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Set
 IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260701182428.906441-1-tamizh.raja@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260701182428.906441-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a54abe7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OkBu-d0m6Dx8VpF2E6cA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NSBTYWx0ZWRfXxoGppJ0ygP7W
 zCAZ96HvTrQT7DmCO4XN8lXjxSeIzWQlaVDBs4q60N4lE9/xfQBrnBBHT36u7MYFtVqMXR9EKUJ
 +EJjXZ5KYebBm0eIUDgeN2nJqV1DPLU=
X-Proofpoint-GUID: SuhapBhI0_pl-AblfH4oZ9iuql6JASBA
X-Proofpoint-ORIG-GUID: SuhapBhI0_pl-AblfH4oZ9iuql6JASBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NSBTYWx0ZWRfX+AA+sD4e6wwo
 evKcj7nWRjDdk9oHGjsyEpYeg5pctBT2NO0EVlX+EEF4Tmuw79wDbuLPN7zQPeSelZJda3B8BIh
 l/t3IQpSpmVqN/dCiwFCO3GqESUqcUeeJVhMQgFUGO8ZE0aZdPSVRV7WQHW030XDpqadG9YaD/f
 5QBtxXXWZOoy/RgZK3WIczNdU9FeuN7mRnxSZvac1Y5ORSf0EJAlA/N6Q4iWAa3Qz6QvSbkUd0z
 zcHAjAreqO871A/IU/6I4MCyycwSidGHen/PtticebJfyoDegLDeHK+q2U+jFG0MxZf5XrkhBCR
 t25S14Tzx3q7xH85wZAFfJsbj4wT5qzXx5Fmdryx/pZO31N8hM/5VRZ53NNoICSV4X5tSHftiWE
 RvxIEsWysh1i6mNkWA1px3xPYV/o6T+T+HAFtqOkOwPuzW4OghsPvWcIEdttWDQEwgE/yUys8Kv
 MLliK1H7azIeYCi+vOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_021209_038354_D8BA382B 
X-CRM114-Status: GOOD (  10.46  )
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

On 7/1/2026 11:54 PM, Tamizh Chelvam Raja wrote:
> Currently, IEEE80211_OFFLOAD_ENCAP_4ADDR is set when
> IEEE80211_OFFLOAD_ENCAP_ENABLED is present in vif->offload_flags
> at the beginning of ath12k_mac_update_vif_offload().
> 
> However, if the WMI vdev set_param for tx_encap_type fails,
> IEEE80211_OFFLOAD_ENCAP_ENABLED is cleared but
> IEEE80211_OFFLOAD_ENCAP_4ADDR remains set, leaving the flags in
> an inconsistent state.
> 
> Fix this by setting IEEE80211_OFFLOAD_ENCAP_4ADDR only after the
> tx_encap_type has been configured via the WMI vdev set parameter.
> 
> Compile tested only.
> 
> Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")
> 
> Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

