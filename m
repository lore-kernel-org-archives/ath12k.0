Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9B1C02194
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 22:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfNHhPZmaubfMHhcVyjBDXbxt6ao6aTaeG9ns+8w5Ck=; b=fvGLeucjoo986fLZo93ZTi6iWO
	uKxjXtbSZxwQGJ154r7XsvN+aUxE8lGO3I+iB2lGkLxm3rd1U0JvhpJfeb8bXchS0p5cR6G4EOolM
	EMsjHnwf+h5CIVfjqWIcXG9nDrTKN+yH8o6+z5F14BSdlXPdwdny6fakN2WeYtyEzaKwRpUn1+Sca
	jtZpRmbL7HoPUQO/HTyuHxVfIt/QkJXE8kfY8Eq0kIcABmo14SJm5HsjbYckPBdzphBU23oZ841Y7
	Uetn1MXMxWkf/L1/roSdmJrSIPOBE7eqGyFs3pmnsDCUXCH+8+kzZpwdwUqyqZsmgaIKMY7h2FC+t
	wV9A8yag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fk-0000000GpGk-3amf
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 22:49:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fh-0000000GpE5-3b5V
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 22:49:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513E5Vg8002360
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 22:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CfNHhPZmaubfMHhcVyjBDXbxt6ao6aTaeG9ns+8w5Ck=; b=HKz6lE4p3Fx1Q7gg
	+q2dXT+rWaiVwwesvuEC5DpYIY1GSzUavcgiA1pcn7If/pTtFtznYWI4B4NdedXz
	DiQ9/dE0S4SZ+6s/B8kHX/bWKSikAjZyXIfT4Kmsbz4BQMRMXkYbEwXjDHr/SdK1
	rKdsbhAPvo0ptdlrn4iuoSlP+w49MxYJCYLsj5TSUnBiw8QBuEaNmR51DgJS1Umc
	BGink3qipWI3jz3S4GCOdqnC1A3wtnVTBRh0wC3Y/aPUG6xrwttGmCiWSMaSok2d
	sBy8ldfj/1RKWY8j0CLQ+whv/NwFkHrrywBjO23uFTBG59DQqUF4cmQEb5sd5Re2
	evQHwQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jy8s9442-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 22:49:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso9469368a91.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 14:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622952; x=1739227752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfNHhPZmaubfMHhcVyjBDXbxt6ao6aTaeG9ns+8w5Ck=;
        b=jZxZjUekjOYc/tF7Agedakwn3ur4nnSPq2y5Wz7ZZHauwMX0qUqZOb33QHnK1sRR/O
         wcDtmmXNqmLLfbMsUMlYQI2HTObxS3fMpMlJSr0u8zln31Qi+tfWBn9HLaeURfjY3ITB
         CmsXoXoN+6JpKga447lp9ORKZHXNyFEe+eWOJqRX0SHv8GgGOgUJS2VyKtidCWWnAasW
         9DhJq3qL6pCxZAiM8+FERzHoD5QEgwpDHxsF0I26GhND2+7oK7PPkdlUAprT+NcO9Lje
         Ff0VexQFj2oBA7ElmkvNd9CqLciAuK1UnaEhBRya6xRBrw8I447jSt58bGmLoXgGcwWE
         V6Bg==
X-Gm-Message-State: AOJu0YxwviD5DghKsiR8AVt+UdB9vpkf7K3jkSS9DtPzEOXAQS9A249i
	Cd7NvJ1seHOZfyuREAVsri5Vgr/vmWg30OkYEZhSkHd/3TmBUh0h+CAP6GODAnE2Lh2psMsu+8P
	mC/o/8QjX7GxdSidTXNnPk8ShGgYwdv5ukHOcPzleeD9oigZ1sqWBanGCdq7i
X-Gm-Gg: ASbGnctZVYjw4i0Q0yKtV3pRGAu3WMRbNWzHqKGjxx813MSkBYjZR99H6aTyKwv2mjq
	ZolALD5e0GjmjnPZLktpC59uA1iKePN+6h0OBdLKNV7Sc7GmXylKuvYyJcjykEmnITkkRHGhHDM
	lZjPymjDFS1XMFal0nwfYbwyHdyjzNtNROFu2oRS9q6qXBnkjrWd8SfH2rU2Vy+GTb4UILQbBJf
	d7tK6wi1Bx+1+a/VSgMoaF1dVXZzljWsZOH26/5I2A6Fr2EBj/4oc07w2qo7xtxh1YaEsczLVZk
	cswT7ol9iaQ9Blz7NIjcCEKKsbFsTZdxjkU66msOow==
X-Received: by 2002:a05:6a00:391f:b0:72a:8461:d179 with SMTP id d2e1a72fcca58-72fd0bc838cmr32181673b3a.1.1738622952562;
        Mon, 03 Feb 2025 14:49:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhHz0zbLpxUVjcBazXmNhIdeCVd0SdNR94jZYmImaahbZ2YuMremEgLdAuEl6+pyW6jPGl6w==
X-Received: by 2002:a05:6a00:391f:b0:72a:8461:d179 with SMTP id d2e1a72fcca58-72fd0bc838cmr32181647b3a.1.1738622952097;
        Mon, 03 Feb 2025 14:49:12 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba353sm8887444b3a.112.2025.02.03.14.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:49:11 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Lingbo Kong <quic_lingbok@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250113074810.29729-1-quic_lingbok@quicinc.com>
References: <20250113074810.29729-1-quic_lingbok@quicinc.com>
Subject: Re: [PATCH v4 0/4] wifi: ath12k: Add new features to ACPI
Message-Id: <173862295146.3734728.7169166499686289961.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 14:49:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 0WfodSB7xNc58O-PtzuFFZGlAe-ZCRGi
X-Proofpoint-ORIG-GUID: 0WfodSB7xNc58O-PtzuFFZGlAe-ZCRGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=766 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144913_912282_01365A17 
X-CRM114-Status: GOOD (  10.76  )
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


On Mon, 13 Jan 2025 15:48:06 +0800, Lingbo Kong wrote:
> By reading ACPI tables, implement a method to obtain the ACPI functions
> Bitmap, enable or disable specific features based on ACPI Bitflags and
> download board data files based on ACPI board data filename extensions.
> 
> v4:
> 1.rebase to 0c5fcd9069dd
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: Add support for obtaining the buffer type ACPI function bitmap
      commit: b59d1f8207de4e2ec763a5e58f95811d0eb2272c
[2/4] wifi: ath12k: Add Support for enabling or disabling specific features based on ACPI bitflag
      commit: c6a7c0b09d5f430c36f860af1032e9dfa2dfcdc5
[3/4] wifi: ath12k: Adjust the timing to access ACPI table
      commit: 33fdeb544ea5966abe247b9eb96a8017f7b9b2f2
[4/4] wifi: ath12k: Add support for reading variant from ACPI to download board data file
      commit: 0a43c3a520e96d086d0aee492bbcf73ba737a637

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


