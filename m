Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C71C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 05:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8phPWSksCjeCsY5PX4ukL4G28A+omK3tTKgilFv7DgE=; b=JVllhGUhe9b34VWYT7g9QKdf68
	JlVH9ug7BnfahL/DEM36F2eeTaD5aLsAAaHu5zjE57dSHkaQkmGWJUyZjOWUkHFiipY97wQfrQcI/
	64KFL/FKN3WZuI5Mr+jOGfeoTc4FsgLAwgDhvphrXRNoCL7KcGif/mdHyxifxl0b8/yHi8BW72ZHg
	QMMRaK7YGL/QBYs3zUerk9cnv4/O7n0pP9fEtvkNX7JmzTgseuSdZPq+xgmGtOoTipuVvoF4I2vFV
	gHyffzsVVvaj4T3icdRjWQOYrfe9sLr+ShEbtdCahgLXbANcox4fZ3AaQnxz1q7ynMwW1o/xMhbEE
	akK0n4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4es-0000000DiRS-1lh7;
	Mon, 29 Jun 2026 05:35:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4ep-0000000DiQs-2EaU
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 05:35:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NErO1729590
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 05:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8phPWSksCjeCsY5PX4ukL4G28A+omK3tTKgilFv7DgE=; b=ZMDZtHW8FJzXiA+F
	a3Y4Gu5bmY/fDnJqzdfe8Ww8v5ykCigliD6ltpFxItHijaM8X39LlGgz1D+s3Nqh
	DcBv6CuPALT3n1p4PrDkw7X/2MPQ2kgrEwPyybGCLcKQr169kO6eVw7J4bfiO/jU
	b0S5+P5mjhneGetjkL6ANWCOEIcHkevdrarDQAM9ECrFWh3C/DCjO+xp+Z+CpYE8
	kL9gCxQQiEfntsqG1QxvNGg65P1uhVnqTUeGaLCcquevkbqnc5A0UuxLK59Xd33k
	3bPeR5iDCPJ4mfDax5+gJSjgz0WsPCDAZwxPPa9F/smgiJ2CNImLdAifv6NQTZQH
	YpaCfw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vj1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 05:35:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c9bd8b9c7so3476128eec.0
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 22:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711346; x=1783316146; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8phPWSksCjeCsY5PX4ukL4G28A+omK3tTKgilFv7DgE=;
        b=DUYDbJQGykgmIjNvSVRR04TldGK5lQVoX4PfbCQZaY+nC25aoyjy/54IHrqeZESVS8
         WEMPnNQ41Uk4x5v/+z1Jp2UevLU/XaLIg1wNzqJDuqKPfZeE/420kxH57DszEoLW6fml
         9nDtbLHGGaaH/8Uv+3ahOztavSc6KgysevUxQnF3xtNmJf/BziZdOamH1ii0pCgmMvtv
         FyMx2uqYkI90M4J8zYp98Xs5ps97Wuf11DmGyK3DNGnbr93OL+yh9pSnRieFJYqL3asH
         ULPY3yby0JJKgbjUP0HCeCRD9dASZnfzMyDJn1SFOivt3kVWIXvOtCJnRsany0sPovB9
         78Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711346; x=1783316146;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8phPWSksCjeCsY5PX4ukL4G28A+omK3tTKgilFv7DgE=;
        b=PeE8Qb6Zb4dHd4L2I4NJbO5S9xT3XVnE5K8GOqqRhPXsEzPLHpRmLgWZAbPKX/U3n/
         7mdpTuAC9CxD8dYvCEMusylRIlrCkCvbx7mdRv4cQto0NmmkOXbHBUg64b6v3Eq7cPw4
         1gE9SSNAwvju2nsVaq29L8+BgjxGWWd9JrT4NfxC9wYD3DRR3bTVvVai2YfIkyRIaZpz
         KT0DhorrZyDzuCSlijLESlS/qZdIwjMo0JhUjZxWekJo3GGqOodZZ7bm1ZKQVOKhi3Sn
         3uqocOiEiK+hxjCipIpGxEajnw54395rXDigITbvQbKIeYoPRioGSIPaFFHn3pDMhLcf
         ya5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Hbtdas2ONrgOJq8jY97q+qjDfwrJ0NkK8rR5Kf0ue226DJKkyJgwD9lnxoPcwyks3VAsw5o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdHsdf1o+e9Q8kP3PuFDzcfAE/AlKtGVK+eqEUsAyWEKNVslNG
	XlkqqY73F90ldRnEAVkuLvizrsktn/OrsvtyknYwkItsAPu5dvmyjCm9HxjjTYmH4NVW0FTvWOm
	DuOtLdRniU+BkQdgbH16geAlEWoQzPmcmKCnnZHnP/kH1is2vkho/PFV8n3Uagli5
X-Gm-Gg: AfdE7clFPNtbU7o34UoT7Mex7xxOI2hgYajsy6Hb10dTo15G/JqGR8xjiwjEOTUm9sD
	mFGcf9SCmMLvWDcg0aQi/2y4/m4nf4x6wc9Sa9UG6Fjh66YBFhG1i+IvFFitYlEcMbLT0HDbm9E
	r1mItnBQk4qpH0QrseCoxsbnNhwZp3C65fRJkLaZg+gZM29jV4uSrJ4T7iqxziwl/acM/ArbpK6
	vx582oO6Xc+I0cvLQPZra+x++cGLEo0R7dPjRLlu6rZG+yaOCgyEc7CrkB41sl78oURcpg6c7sy
	PBoomlWdnQIEgK+Mz9+3UU0inWaYy/30zSX6OPyWlyw/J6HXj6nyUajm6XN2SfExz1C6upTH216
	BSOUT9SrFd/92Irm0/qMcmetK478XTR+jhnUICLKXIapFKt24+1w=
X-Received: by 2002:a05:7300:1903:b0:304:819f:5029 with SMTP id 5a478bee46e88-30c84d109cbmr14031405eec.2.1782711345994;
        Sun, 28 Jun 2026 22:35:45 -0700 (PDT)
X-Received: by 2002:a05:7300:1903:b0:304:819f:5029 with SMTP id 5a478bee46e88-30c84d109cbmr14031350eec.2.1782711345425;
        Sun, 28 Jun 2026 22:35:45 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52eed6sm40005912eec.9.2026.06.28.22.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:35:44 -0700 (PDT)
Message-ID: <538b932f-5858-420f-bac0-cb027eadce1c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:05:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: fix dp_link_peer dangling
 references on AP vdev rollback
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com>
 <20260617-ath12k-mlo-peer-delete-race-v1-1-ab3c4f455dfb@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260617-ath12k-mlo-peer-delete-race-v1-1-ab3c4f455dfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfXyPaJ5AjuSxzv
 wNc5kkWNsEi7rJVgWDVHHdfA3FFs55KqyW3QjG0EenCFMtNNNdmngYf5X5qEU1LWEUJtgUxV9Ox
 POG0+2okruYrLdlhuHRGSAmggtIgYlk90JmYto2XNKGo2CGaMvsAoGHNQmHVMSfcIobJ+avWlh7
 vMOKD/dlxF9e36x2Tk4Ks1QUGL131OtOxRdrkz0KPqHy76LNk3t9cMTFici494MfyjiT2XaG6CI
 QzjquLJl/y5KUkZg7JJcny+vO177qoj+sHnlwYWZqi4yQF/me9jq9nFCBaUBNJ0Mu3Byw7utWAw
 V2wTcIN8kvEYICt5M0gu3JxonTzNyhbq3cyuenzThdPFXDXenJzTS2lHEczpIUYqQ3w0g8wDTuM
 6UbWm/C/nBIGDzKP9aNrULHesfFLVeay8UEfZWGkRwL1S+vCsnXLO7otC5kB73/DEJt1hQ9y4fv
 X4t+NK5eVzXNsOHZoDw==
X-Proofpoint-GUID: TPTGqjIEcrQoA01_R30Ro9lSLECsl2HC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX5TPZcrBRky39
 LAV27LV2avZOzjY+yN8duIjFBK1fRFp3RPpOcxnq1nWf8qulbu6DwBvuZvbYXExCKjQRXb65w9+
 G9hFZwUqF+sNMbSrHUPOv4cPTeXHewE=
X-Proofpoint-ORIG-GUID: TPTGqjIEcrQoA01_R30Ro9lSLECsl2HC
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a420433 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_EJcpLEw30hKsFGvHqkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_223547_733424_6924BBC8 
X-CRM114-Status: GOOD (  15.09  )
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

On 6/17/2026 2:58 PM, Baochen Qiang wrote:
> ath12k_mac_vdev_create() for an AP vdev creates the bss self-peer via
> ath12k_peer_create(), which finishes by calling
> ath12k_dp_link_peer_assign() to publish the dp_link_peer in the
> dp_hw->dp_peers[peerid_index] RCU table, in the dp_peer's
> link_peers[] array, and in the per-addr rhashtable.
> 
> If a step after ath12k_peer_create() fails the function jumps to
> err_peer_del, which open-codes a WMI peer_delete and waits for the
> unmap / delete_resp events. The wait_for_peer_delete_done() path
> relies on ath12k_dp_link_peer_unmap_event() freeing the dp_link_peer
> when the unmap arrives, but err_peer_del never calls
> ath12k_dp_link_peer_unassign() first. The published references in
> the dp_hw RCU table, dp_peer->link_peers[] and the rhashtable are
> left pointing at the dp_link_peer that unmap_event then frees,
> producing dangling pointers and use-after-free on subsequent
> lookups.
> 
> Replace the open-coded sequence with a call to ath12k_peer_delete(),
> which already does ath12k_dp_link_peer_unassign() before sending the
> WMI command. This drops the published references before the
> dp_link_peer is freed, in the same order as the normal teardown path
> in ath12k_mac_remove_link_interface().
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 5525f12fa671 ("wifi: ath12k: Attach and detach ath12k_dp_link_peer to ath12k_dp_peer")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>



