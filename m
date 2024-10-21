Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E684CD15D90
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyC7N2hz+/WsPdXOknuF3Ss0F+Np26FogPfxxsjIHt8=; b=zGQ9QluICeenM4U3k4kropfdra
	S0fCs7GV9JkJe2kd6zl8sgvttrTf8cL89hWvxImXCJt6RqXPJa1oinCth29T2gae72+78Kihy3qni
	J9Pnh3itiX9SCF9qpIzL0dI2KJDVzKbmWZ57xb2RGnjl5gq4ThzyefIvcb31mvIsF70fpQUErdAdy
	xrcZDfhE/t/upsMCkjj9H1tsw1JgkLmaFBeC/1HUM0098IclhU7AMpTzRE8UJyHMFDwgvtoOkeJvP
	rktKewEu7vuFtpruO4UpKPEPMFGkZYzIvxjpI9t83/YAlDjUuRF7By02qKlxaK5UPq7G9Yx+NmSe6
	6PUxt5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sf6-00000007SMf-2bF8
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 13:41:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sPH-00000007PWc-2hI7
	for ath12k@bombadil.infradead.org;
	Mon, 21 Oct 2024 13:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nyC7N2hz+/WsPdXOknuF3Ss0F+Np26FogPfxxsjIHt8=; b=bLDxiCgwAIqgvxFSQh3yuJ6bvw
	0a1suCX93q5K+1P6HHuP/U12eC7BdoAAoEAxbNfXbZRFm6YNHFjTcUplZAi89dd+GbvugT38RGSOd
	E5w9VtaIqj7luQAOthWbGvN+j/xWfct2ekBZ511ouyceOJ7SzmC0p45y+kSkcQmfs1nTXc8SdTILK
	+Tr0IhD9uBqECS7os4PTNO475F9fhg5H1gpDRVgVL6gSXgKM9Ocz8ueloo+XmwO6k2rq+02wJu3fU
	wqaF7YX90jkxfq0Lyx23l0253ZgJZTgUOb216BKXQjL2s8O5kNgdqNR1xCing2U1RhxA88fXDJPcy
	1/N4s1yQ==;
Received: from mail-co1nam11on20600.outbound.protection.outlook.com ([2a01:111:f403:2416::600] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sPE-00000007xDX-0Ulb
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 13:25:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnGghAfCJKdT+5BBH3flN+wn6EuoNQMmcnfoXkC0izBBlXJHy03n8J9mtMn7p837NlotXM9hntK7YLdvEkA1YrYAyrSnIn4PJgy6xX4H2wjRYZX6q1IuW30dfM1e7QuRZ7iOupsUPBs/xwwrBsd+XoeVln1VN/h1aWw5QVZxL/7lUuDqqRiSsPupM/UX0LAoWb6pHOTeNBdL7Xnd/AaPyL+mX2ie/Tdjm2jdrC27lMugGxp1J7CaFhJrND76grDtArkqwIMw6rGHJxJ3ajNCQTvLRXFWNv4uz4qRddHGOENnSPbCtppdAQie75EMqNRh8Jop9TW0K4KNeM1E8Hdbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyC7N2hz+/WsPdXOknuF3Ss0F+Np26FogPfxxsjIHt8=;
 b=scQ4F7lSZO41KrKg5ewbDgM4LWqsVWmkis4fJKTV6fTNk19qDDoXqOO8ocEJqolmSquluUofpxmQ1ZySssYRYF+U85X6r1nKZAijeDmLcuYmlJgnUMmM3NoL0AQcaXpr/RYxFFMWH1pAcGkN/kGXLpy7Sq5p56CiDx2e6kf0+yndrOnlJy5BAjdSNiviFpBm2B2tydfNeiNYLGnFE+q8hSrxHDp30Cgu0WVRQUxgrV08u1bs9fiRLU293pf4YP/NK2qGPeKatPIQPjDZJG8zzmVcLm/TvDm4oMnVXxMPtO0ftf1MMb8r3vt8UAbWXmTeKMrbY4nc6GtIC2OdpYM9rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyC7N2hz+/WsPdXOknuF3Ss0F+Np26FogPfxxsjIHt8=;
 b=t0jpYZ1cLsCJPz6KKEMd1CYl42CIHpEU9sJrZfu4B4lMsDJOLPhEPd1C8cKIj5w468SkDH/Bwj3WZyvcBFN8FRNHBwOu4mHzWelObSxJ7dyRzEninJIoPnKb0Tu+5L6fuLjh2n3xaotqwhAmRMwprg19LRdhIZy4a9WFfK+1Sew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 13:24:55 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 13:24:55 +0000
Message-ID: <42dad05e-8f4a-41f2-95b7-55cedadfb46b@amd.com>
Date: Mon, 21 Oct 2024 08:24:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath12k firmware 20241009
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-firmware@kernel.org,
 ath12k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>
References: <015383e1-f37e-4a1d-b2de-f3261f5ea1f4@quicinc.com>
 <d496a87e-73a1-45e7-8ebb-b907d58dd4f2@amd.com> <87bjzdq1d3.fsf@kernel.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <87bjzdq1d3.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0019.namprd18.prod.outlook.com
 (2603:10b6:806:f3::30) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 74082937-11f4-49fe-7f8b-08dcf1d3c075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RU1uS2I4MC8rbjRhNjFrZXFpVzVqODVHdkduVFZ0eW9ERWRKVXNYMElWU1Rh?=
 =?utf-8?B?NytabW1kMnNrZzhMVjlGbWgzM1AwRE1MQTlhbDVJMVJNTXB5N3RGaFFPQnQr?=
 =?utf-8?B?cWd1eGdNMHg0QXM1SjNhQ2JvdnJuYWdRWXJwZVZIclp0dlF1UTV6OEk4UEl4?=
 =?utf-8?B?QUloaFpoSmdpRnpXbng1a1JvM0hUVU9aeDdoZk82SWhZa3hWViswR2dXMEsz?=
 =?utf-8?B?T09ENDUzMWgvZEI4NkJtTi9Kc1pYYnlHNHpKL3huMG10dGRTNkhLOTQrSmRD?=
 =?utf-8?B?NURVZ3QwMS9ZVVRnRnFSZ1QrQ2ZwK3B6b3d0cXcwTWlWYjRJSEYwNGpCQWZs?=
 =?utf-8?B?bVF3RmxWQkNmZStNdVhVMTlpcGRGOWZCdVJYVHNlRFgwQkhlZEFyTkhVY3pt?=
 =?utf-8?B?V3NvdEt4UTJJc3ZpV2VTSVB2aS9jNFNXRUZXWk9nWEhFa3diZEN4eWhQQVdz?=
 =?utf-8?B?VGNUd0NnVEhjWTlkMXpQeWQ1a2RWZ0ZJQmtWWWRpVk9Ec1N1SFF2TVM0Z0FS?=
 =?utf-8?B?RlpMUTdOVnc1VVU0bXNyOUZlSThHOXc3dlR3Zjg2YkpDSEcxVC91RXkrL29w?=
 =?utf-8?B?RTNSc0dackYvVFBNK29BWUk1U3g3L2xhTmtUbmdDWWVhT3ozdnZ1U05iSUtS?=
 =?utf-8?B?cmcrNzJvbmVzbndkdWRkS0Q2QkVwYUt4bUdwbktoUEdUVUpqRWpZY1NnRE5i?=
 =?utf-8?B?Z3RHRTJlUUcxRExmZzF2aCs1SUVCVTZOZ0FOenJHRkxxUktTdVN4eFcvRzVH?=
 =?utf-8?B?U0l3RmlwSlVpTGxqRGFSWVA3ZHRNZXI2VVJxWnFQRTNNY0kzQmlTQjNlT1JB?=
 =?utf-8?B?UWNyQW0wN3Nxc1NVUGg4d1FHTzdMeUR1UXp5czFVUTY3aDljV2FFNXdWRGhM?=
 =?utf-8?B?LzNjUnlZSVQ3Rm9RalBwQ1YyUWdVM0dza0txRkZ2aWNjTDBFR3d1U2x2MWhV?=
 =?utf-8?B?S2VCMzBXcXVVQjk1dkpRZURNTkVNNzJyTk5GN1pITDNEMDJoOUJJWEdOZCs0?=
 =?utf-8?B?VWNuaG9NcVMyd2RodDZ5YWJVNklQUC82U1pmNTE3Z3hxN1RmVnVEWWIvbklw?=
 =?utf-8?B?UDBreklSeGtwaGpkMUJ3SWJXVjROZXMxTm9hOVhJR1lKRGd5SmVEQnJHMHkx?=
 =?utf-8?B?N2JFMi9Cd1VRNE1pZzNxVCtLYmdoZlIzTU5kYjJnRU9UbHdyQWs0NkJYWWVj?=
 =?utf-8?B?ZHpPVDB0WFRiS21hakFOMyswVzhydERycGtzSVhFbndudnpRZ0tVeVNUSGl0?=
 =?utf-8?B?bWdyMm4vZ21tWlVja1hjV3BVS2JlRm5ZcHFqZEVaSUEvejF0SHc2Mlh4SHZs?=
 =?utf-8?B?UytxbHNUS1h5Y2ZVTWZ3UVRuWDk3UURpZHE3WWxOWjJaOTBVc1FhazF2cHI4?=
 =?utf-8?B?TVl1VUpKeWFGSDFoZ3UraE9QOER4bDAzMFp4WjdEYmNxcERORkN4UzNpaGdM?=
 =?utf-8?B?TlBpMHhoTHp4U2xRdCtaZWZmM3VTbDlxczNnTmQ0TjZQMDA5eUx0NTJyRGFP?=
 =?utf-8?B?eTdkelZPNUtCZVg4cHhwMklDVFo3T29NQk1lNVNRNnhlaXVDRC9qd1VwdXBD?=
 =?utf-8?B?QlBTWU1qbDZmeHI4Yk44K3ArNmoreGFuYzVOeDFUWnhaalZzenhvc0N0ajRE?=
 =?utf-8?B?bDM0c3lTK1UzdzJJaXo2aUF0SDJIb1RJZys3V2p3N2IwUlFpRzJvMGRwMFl6?=
 =?utf-8?B?RGJsYVYwV3N2eFBvdGtrZGRKdnMzOHN6QndhL1F6SFBaYnlrUkozcHRoaDlS?=
 =?utf-8?Q?S8eTjXZ6h+Ttm5CDae+YqbqLIsSIAMDDVKi+SdF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUhJQmQzMmJYUlZXUkswRHhXL2xWVzV3VnUyUWl4Y081MzduSFBjdnY0Z0hp?=
 =?utf-8?B?eERqeEVmeXF6V21yODVSaHlReldNQ0dyNXZ2QVlpaHZlNlVWaWV1enYxZnNV?=
 =?utf-8?B?bVJpWGpMWSs5TlNERGVzTlMwWXE0RjNsd3ZEWldhVlYraVZHOVQ0T2NRSTQ4?=
 =?utf-8?B?VWhMTUQyNS84V2kyWjJHcEJHa0xnWTFnWFFDVEt6QWhjZUd1UlArMDc0bG83?=
 =?utf-8?B?eklaU2xvM0VPRjhTUEM4a3R4N2lsS3NablRDUEVuYlJzb1RXRk1QSE5RaVlV?=
 =?utf-8?B?MUEydi8zbmxwYUFVR3J3MXBXVGFtSU9SeFRBNk9hR1JmTDU5SysvV3hqaUdw?=
 =?utf-8?B?cHNoWGtRZ3UxeXBOUm9KRTlHS2xSSUo2bW1GUHZTQ0JhN2tScUhNN3FzY2Uz?=
 =?utf-8?B?THU1aUNpcUlhZkFTMUhUdVBINDRTUVF0Ump3SUdsWktuN3lXNWlNUk5Qbzhr?=
 =?utf-8?B?ZVNTWlRyK2JVZTJPb3NlQi9CVlhGVWp0Ymt0MXhGZGJOTlBEdmNxbkJLWkYv?=
 =?utf-8?B?TjdWOVhmb0djWmdPSXA3cHFjVjdTMk1zMCt4ZzBEbFVxWGkybUplYTJ0Szk0?=
 =?utf-8?B?dDV1dzV2MWdNd3VrVnpFcDlMc0p1SFROTFEyNnpWZk4zTGFsanZGWXpDMjgz?=
 =?utf-8?B?cDNrcThrK3p1dVhlWGFHakxGZzdJUFI3cy9MMjBBWFpXc3g1REhyMlRtLzcy?=
 =?utf-8?B?TUYyNUNlUURIeDEyVGZFTWZQcUlOLzhFQkowbW1qNVBmTkFpZFpJZm50Tk1l?=
 =?utf-8?B?aVlOWW5VYTR5RU5aNm10c29YWkRkY05pUDRxQkhmZzdLc2J4WWRRekhFUWNO?=
 =?utf-8?B?ZkdsWGxOUzBUYis5aVRMTitGL1V5WjF4NEJsUzFBNkg3V01BQ1FtR0dDYXVE?=
 =?utf-8?B?elJOMElFN3RaM1dnYmwxdXBWUkxwajd4bzIrSFk3NVdCYVhvWTh1emozcTJG?=
 =?utf-8?B?Z2ZsMXd4QTBYZXFNbUU3WVJyWUUwcEFIcyswQ2V5NktubDFqSXVrSlNyZW1Y?=
 =?utf-8?B?UVprZDNnQjZmZGRRdmhSWkFobyt1RjViNC9IYzZnWC9CRjJhT2lNdFdYNFQv?=
 =?utf-8?B?Z0lSRmVkeGV3TEgrUnNCbXRJQnNBQkN0ako5M1B4dTJLRHJSRVFUVzVNSlEy?=
 =?utf-8?B?YlY0Zkxad1htK3dUTkxOTFVkWTR5MGN4NGdjRU5lUXZTeE5CQjZKTTF2WjlT?=
 =?utf-8?B?WEFwZzZMZHg2THY2ZUUyMFMzYUh3bVJoM0RiZHdlZGt6d2xoV1JhMnFZS01x?=
 =?utf-8?B?VVovSlZBcjVYQmlTeDV4dmljbXBlTENPRVhyQitIRVpyTjl1WVBIcEErZm13?=
 =?utf-8?B?UFFyM2liWXdGdjY0Y0QrQy9HU1g0RWxGL0V0SEN1YkZWaTBOaTNTT1lTM1I0?=
 =?utf-8?B?NmpjN2JyV3JPdFA2a2NkQWJVcmgvaVI2ay9za1RHaExXK1B0VG93WFRReENk?=
 =?utf-8?B?ajNqVkU3RTdyQWlHNGErOEFjRi9pc3FidGhETDdPWGtVMjREL0M5emRkU1ht?=
 =?utf-8?B?bG1ZZ0hEVGRvZER3cmZ6YkMva0o0Q2dUV1JXU3FsT3FMVHpmMGFaZ2NPTnBK?=
 =?utf-8?B?Qm55bUZLVWJkN2VJM3o5SlRSSU1HSVMyOWRjbXNjbEVGQ2pjOVRJMlFNeUQx?=
 =?utf-8?B?LytJK0ZHSVByTlpsZWxVeklualYwWS9FamQ1UFJtZ1VXRlg5MVBkSGVoSElW?=
 =?utf-8?B?UmFUSGh6SW53T2NPcWl6V0RuOXpuNk5INHRiOFZraE5NK0dhTTRHSmhSNG5K?=
 =?utf-8?B?RHB1eEpWWmM2U1VEYUVKTTZhUVZrSHdtR3dSaDVjTTBmR2JyWG45Ry9GbEQw?=
 =?utf-8?B?NjZZYW1DNFZoVE1EdzhiSlVBdnVsMnpFeDlhNDNTdDFBTmZEZjlFekFHVHU4?=
 =?utf-8?B?aUl3Q21sS2NXT1pCT08xWVc3RGdubFFMUXFYcEJsdXp0MlFkdEljbzE3ZGRp?=
 =?utf-8?B?UFVDYk1LVjVWb2JIdXhTOU81a251L1VxRGNoY2Nwa0Nsa3ZpaEVMSE90aFBx?=
 =?utf-8?B?TzJGbFFmd2FIcWphNy9VT2U0czNrR0cxdktIM1hXT0hqL0ZqVGVCQ3FrU01j?=
 =?utf-8?B?VEJNdU82ZzRyRmVqbDdCMHBPbmx6d01EaG9KVFdheFEyTkZ2eTlDcGwwTnh2?=
 =?utf-8?Q?DDbtFK8jQJ6FVpGq4qEH8qHIp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74082937-11f4-49fe-7f8b-08dcf1d3c075
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 13:24:55.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSXfOY+GYA+ahRw1OeE3UBHc/WpI2KzR08b8dI4btHsU/Uy1PXKDt2/ijCssHShvo28XwfAWv+sbiQw7PzRtkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_142508_279333_C458C4CA 
X-CRM114-Status: GOOD (  12.41  )
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

On 10/21/2024 03:58, Kalle Valo wrote:
> Mario Limonciello <mario.limonciello@amd.com> writes:
> 
>> On 10/10/2024 13:49, Jeff Johnson wrote:
>>> Hi,
>>> Here's a pull request for ath12k. We have a new ath12k hardware
>>> QCN9274 hw2.0 and an updated board file for WCN7850 hw2.0 which
>>> addresses the issue described at:
>>> https://lore.kernel.org/all/44ae68d2-24b6-49d2-a4f9-ae9cbf6f9950@heusel.eu/
>>> The following changes since commit
>>> 919f79f9fb5536c1928a15ac82a2e53183b213cf:
>>>     Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04
>>> +0000)
>>> are available in the Git repository at:
>>>     git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git
>>> ath-20241009
>>> for you to fetch changes up to
>>> 42d754dc98e77e43bcb86def5ea60e009cc49be2:
>>>     ath12k: WCN7850 hw2.0: update board-2.bin (2024-10-09 14:24:59
>>> -0700)
>>>
>>
>> Hi,
>>
>> This is pulled after a rebase to main.  FYI we had a revert in place
>> upstream for that board-2.bin because of the regressions.
>>
>> You can double check the result looks good.
> 
> Could you cc the ath12k list if you make changes to ath12k files,
> please? That way we would have avoided the conflict in the first place.
> 

Normally this doesn't happen but there was noise I was hearing 
downstream in distros where people couldn't use their wireless because 
of this upgrade in addition to the kernel Bugzilla.

But yes if it comes up sure thing, in the future will tag you on Gitlab 
if we do something like this again.

